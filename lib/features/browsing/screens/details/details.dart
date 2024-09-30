import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:szakdolgozat_app/common/widgets/text/section_heading.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/bottom_add_to_card_widget.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/product_detail_image_slider.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/product_meta_data.dart';
import 'package:szakdolgozat_app/features/browsing/screens/details/widgets/rating_share_widget.dart';
import 'package:szakdolgozat_app/utils/constans/colors.dart';
import 'package:szakdolgozat_app/utils/constans/size.dart';
import 'package:szakdolgozat_app/utils/helpers/helper_functions.dart';
import '../../../../common/widgets/text/t_brand_title_text_with_verified_icon.dart';
import '../../../../data/repositories/user/user_model.dart';
import '../../../../data/repositories/user/user_repository.dart';
import '../../userbottomsheret.dart';
import '../upload_new_element/model/fishing_spot_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final FishingSpotModel fishingSpot;

  const ProductDetailScreen({required this.fishingSpot, super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: TOpenMapButton(gpsCoordinates: fishingSpot.gpsCoordinates),
      body: SingleChildScrollView(
        child: Column(
          children: [

            TProductImageSlider(imageUrls: fishingSpot.imageUrls, productId: fishingSpot.id), // Pass the product ID here),

            Padding(
              padding: const EdgeInsets.only(
                  right: TSize.defaultSpace,
                  left: TSize.defaultSpace,
                  bottom: TSize.defaultSpace),
              child: Column(
                children: [
                  TRatingAndShare(placeName: fishingSpot.placeName),
                  const Divider(),

                  TProductMetaData(
                    settlementName: fishingSpot.settlementName,
                    countyName: fishingSpot.countyName,
                  ),

                  const SizedBox(height: TSize.spaceBetweenSections),

                  _buildInfoBox(
                    context: context,
                    title: 'Típusa',
                    value: fishingSpot.waterType,
                  ),

                  const SizedBox(height: TSize.spaceBetweenItems),

                  _buildInfoBox(
                    context: context,
                    title: 'Horgászatra kijelölt helyek száma',
                    value: fishingSpot.numberOfSpots.toString(),
                  ),

                  const SizedBox(height: TSize.spaceBetweenItems),

                  _buildDescriptionBox(context, fishingSpot.description),

                  const SizedBox(height: TSize.spaceBetweenItems),
                  const Divider(),
                  FutureBuilder<UserModel?>(
                    future: UserRepository().getUserById(fishingSpot.uploadedBy),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const TBrandTitleWithVerifiedIcon(title: 'A feltöltő adatai többé már nem elérhetőek.');
                      } else if (snapshot.data == null) {
                        return const Text('Felhasználó nem található.'); // Felhasználó nem található üzenet
                      }

                      final user = snapshot.data!;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Feltöltő:'),
                          GestureDetector(
                            onTap: () {
                              _showUserDetailBottomSheet(context, user.id);
                            },
                            child: Text(
                              user.username,
                              style: TextStyle(
                                color: TColors.lightGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionBox(BuildContext context, String description) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(TSize.defaultSpace),
      decoration: BoxDecoration(
        color: dark ? TColors.black : TColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: dark ? TColors.darkerGrey : TColors.grey,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TSectionHeading(
            title: 'Leírás',
            showActionButton: false,
          ),
          const SizedBox(height: TSize.spaceBetweenItems),
          ReadMoreText(
            description,
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: '  Több',
            trimExpandedText: '  Kevesebb',
            moreStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w800, color: TColors.primaryColor),
            lessStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w800, color: TColors.primaryColor),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBox({
    required BuildContext context,
    required String title,
    required String value,
  }) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(TSize.md),
      decoration: BoxDecoration(
        color: dark ? TColors.black : TColors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: dark ? TColors.darkerGrey : TColors.grey,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  // Fuction to the bottom slider which contain user information
  void _showUserDetailBottomSheet(BuildContext context, String userId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return UserDetailBottomSheet(userId: userId);
      },
    );
  }
}



