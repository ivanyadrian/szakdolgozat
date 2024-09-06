import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:szakdolgozat_app/common/widgets/loaders/loaders.dart';
import 'package:szakdolgozat_app/utils/constans/image_strings.dart';
import 'package:szakdolgozat_app/utils/popups/full_screen_loader.dart';
import '../../../../common/widgets/loaders/network_manager.dart';
import '../../personalization/controllers/user_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FishingSpotController extends GetxController {
  static FishingSpotController get instance => Get.find();

  final userController = UserController.instance;

  final placeName = TextEditingController();
  final waterType = TextEditingController();
  final county = TextEditingController();
  final gpsCoordinates = TextEditingController();
  final numberOfSpots = TextEditingController();
  final GlobalKey<FormState> fishingSpotFormKey = GlobalKey<FormState>();

  final ImagePicker _picker = ImagePicker();
  final RxList<XFile> selectedImages = <XFile>[].obs;

  Future<void> pickImages() async {
    final List<XFile>? images = await _picker.pickMultiImage();
    if (images != null) {
      selectedImages.value = images;
    }
  }

  Future<List<String>> uploadImages(String spotId) async {
    final storage = FirebaseStorage.instance;
    final List<String> downloadUrls = [];

    final uploadTasks = selectedImages.map((image) async {
      final file = File(image.path);
      final ref = storage.ref().child('Fishing_spots/$spotId/${image.name}');
      final uploadTask = await ref.putFile(file);

      // Get the download URL after uploading
      final downloadUrl = await uploadTask.ref.getDownloadURL();
      downloadUrls.add(downloadUrl);
    }).toList();

    await Future.wait(uploadTasks);
    return downloadUrls; // Return the list of download URLs
  }

  Future<void> saveFishingSpot() async {
    try {
      TFullScreenLoader.openLoadingDialog('Feldolgozás...', TImages.loadingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!fishingSpotFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (selectedImages.isEmpty) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Hiba', message: 'Válassz ki legalább egy képet', duration: 2);
        return;
      }

      final countyName = county.text.trim();
      final placeNameText = placeName.text.trim();
      final waterTypeText = waterType.text.trim();
      final gpsCoordinatesText = gpsCoordinates.text.trim();
      final numberOfSpotsInt = int.parse(numberOfSpots.text.trim());

      final countyDocRef = FirebaseFirestore.instance.collection('Fishing_spots').doc(countyName);
      final fishingSpotRef = countyDocRef.collection('spots').doc();
      final spotId = fishingSpotRef.id;

      await fishingSpotRef.set({
        'placeName': placeNameText,
        'waterType': waterTypeText,
        'gpsCoordinates': gpsCoordinatesText,
        'numberOfSpots': numberOfSpotsInt,
        'uploadedBy': userController.user.value.username,
      });

      // Upload images and get the URLs
      final imageUrls = await uploadImages(spotId);

      // Add image URLs to the document in Firestore
      await fishingSpotRef.update({
        'images': imageUrls, // Add the list of image URLs to the document
      });

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(title: 'Nagyszerű', message: 'A horgászhely sikeresen feltöltve', duration: 4);

    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Hiba', message: e.toString(), duration: 2);
    }
  }
}


