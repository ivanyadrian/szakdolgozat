import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../features/browsing/screens/upload_new_element/model/fishing_spot_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

/// Repository class for fishing spot-related operations
class FishingSpotRepository extends GetxController {
  static FishingSpotRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to create a new fishing spot record
  Future<String> createFishingSpot(FishingSpotModel spot, String countyName) async {
    try {
      final countyDocRef = _db.collection('Fishing_spots').doc(countyName);
      final fishingSpotRef = countyDocRef.collection('spots').doc();
      await fishingSpotRef.set(spot.toJson());
      return fishingSpotRef.id;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Váratlan hiba történt. Kérlek próbáld újra';
    }
  }

  /// Function to upload images and return their download URLs
  Future<List<String>> uploadImages(String spotId, List<XFile> images) async {
    try {
      final List<String> imageUrls = [];
      for (var image in images) {
        final ref = FirebaseStorage.instance.ref('Fishing_spots/$spotId/${image.name}');
        await ref.putFile(File(image.path));
        final downloadUrl = await ref.getDownloadURL();
        imageUrls.add(downloadUrl);
      }
      return imageUrls;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Váratlan hiba történt. Kérlek próbáld újra';
    }
  }

  /// Function to update the fishing spot's image URLs in Firestore
  Future<void> updateFishingSpotImages(String spotId, String countyName, List<String> imageUrls) async {
    try {
      final countyDocRef = _db.collection('Fishing_spots').doc(countyName);
      final fishingSpotRef = countyDocRef.collection('spots').doc(spotId);
      await fishingSpotRef.update({'images': imageUrls});
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Váratlan hiba történt. Kérlek próbáld újra';
    }
  }
}
