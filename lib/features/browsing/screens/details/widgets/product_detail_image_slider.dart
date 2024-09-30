import 'package:flutter/material.dart';
import 'package:szakdolgozat_app/common/widgets/products/favourite/favourite_icon.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constans/colors.dart';
import '../../../../../utils/constans/size.dart';


class TProductImageSlider extends StatefulWidget {
  final List<String> imageUrls; // Accept list of image URLs
  final String productId; // Add productId to pass the unique ID

  const TProductImageSlider({
    required this.imageUrls, // Pass the image URLs
    required this.productId, // Pass the unique ID
    super.key,
  });

  @override
  _TProductImageSliderState createState() => _TProductImageSliderState();
}

class _TProductImageSliderState extends State<TProductImageSlider> {
  int _currentIndex = 0; // Track the current selected image

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    // Handle case where imageUrls is empty
    if (widget.imageUrls.isEmpty) {
      return Center(
        child: Text('Nincs elérhető kép'), // Show a message or placeholder image
      );
    }

    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// MAIN LARGE IMAGE
            Center(
              child: GestureDetector(
                onTap: () => _openFullScreenImage(_currentIndex), // Open full screen image on tap
                child: Image.network(
                  widget.imageUrls[_currentIndex], // Display the selected image
                  height: 400,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
                ),
              ),
            ),

            /// IMAGE SLIDER (thumbnails)
            Positioned(
              right: 0,
              bottom: 30,
              left: TSize.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: widget.imageUrls.length, // Use dynamic count
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) =>
                  const SizedBox(width: TSize.spaceBetweenItems),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        // Change the main image when a thumbnail is tapped
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      child: TRoundedImage(
                        width: 80,
                        height: 80,
                        isNetworkImage: true,
                        fit: BoxFit.cover,
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        border: Border.all(
                          color: _currentIndex == index
                              ? TColors.lightGreen // Highlight the selected image
                              : TColors.grey,
                        ),
                        padding: const EdgeInsets.all(5),
                        imageUrl: widget.imageUrls[index], // Load thumbnail image
                      ),
                    );
                  },
                ),
              ),
            ),

            /// APPBAR
            TAppBar(
              showBackArrow: true,
              actions: [
                TFavouriteIcon(productId: widget.productId), // Pass the productId here
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Open full screen image view
  void _openFullScreenImage(int initialIndex) {
    showDialog(
      context: context,
      builder: (context) {
        int currentIndex = initialIndex;
        return StatefulBuilder(
          builder: (context, setState) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // Close dialog on tap
              },
              child: Scaffold(
                backgroundColor: Colors.black.withOpacity(0.5),
                body: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// Display the large image
                    Center(
                      child: Image.network(
                        widget.imageUrls[currentIndex],
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.error, color: Colors.white),
                      ),
                    ),

                    /// Left arrow (previous)
                    if (currentIndex > 0)
                      Positioned(
                        left: 20,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              if (currentIndex > 0) {
                                currentIndex--;
                              }
                            });
                          },
                        ),
                      ),

                    /// Right arrow (next)
                    if (currentIndex < widget.imageUrls.length - 1)
                      Positioned(
                        right: 20,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                          onPressed: () {
                            setState(() {
                              if (currentIndex < widget.imageUrls.length - 1) {
                                currentIndex++;
                              }
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

