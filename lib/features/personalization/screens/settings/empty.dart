import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/appbar/appbar.dart';
import 'package:szakdolgozat_app/features/browsing/screens/upload_new_element/widgets/custom_image_list.dart';
import '../../../../../utils/constans/size.dart';
import 'empty_controller.dart';

class EmptyScreen extends StatelessWidget {
  final UploadImageController controller = Get.put(UploadImageController());
  final PageController _pageController =
      PageController(); // PageController instance

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
          title: Text('Büszkeség feltöltése'), showBackArrow: true),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSize.defaultSpace),
            child: Column(
              children: [
                Obx(() {
                  final images = controller.selectedImages;
                  return images.isEmpty
                      ? Column(
                          children: [
                            const Text('Nincs kiválasztva kép'),
                            const SizedBox(height: TSize.md), // Add spacing here
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 400,
                              child: Stack(
                                children: [
                                  PageView.builder(
                                    controller: _pageController,
                                    // Assign the PageController
                                    itemCount: images.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: TRoundedImageInList(
                                          imageFile: File(images[index].path),
                                          width: 400,
                                          height: 400,
                                        ),
                                      );
                                    },
                                  ),
                                  if (images.length > 1)
                                    Positioned(
                                      left: 16,
                                      top: 170,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (_pageController.page!.toInt() >
                                              0) {
                                            _pageController.previousPage(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.easeInOut,
                                            );
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: const Icon(
                                            Icons.arrow_left_rounded,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                  if (images.length > 1)
                                    Positioned(
                                      right: 16,
                                      top: 170,
                                      child: GestureDetector(
                                        onTap: () {
                                          if (_pageController.page!.toInt() <
                                              images.length - 1) {
                                            _pageController.nextPage(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              curve: Curves.easeInOut,
                                            );
                                          }
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: const Icon(
                                            Icons.arrow_right_rounded,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height: TSize.spaceBetweenInputFields),
                          ],
                        );
                }),
                OutlinedButton(
                  onPressed: () => controller.pickImages(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: const Text('Képek kiválasztása'),
                  ),
                ),
                const SizedBox(height: TSize.spaceBetweenInputFields * 2),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.uploadImages();
                    },
                    child: const Text('Mentés'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
