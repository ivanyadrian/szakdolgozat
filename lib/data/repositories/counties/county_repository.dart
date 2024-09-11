import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/browsing/models/county_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/firebase_storage_service.dart';


class CountyRepository extends GetxController {
  static CountyRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all counties
  Future<List<CountyModel>> getAllCounties() async {
    try {
      final snapshot = await _db.collection('Counties').get();
      final list = snapshot.docs.map((document) => CountyModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Váratlan hiba történt. Kérlek próbáld meg újra';
    }
  }

  /// Get Sub


  /// upload Counties to the Cloud Firebase
  Future<void> uploadDummyData(List<CountyModel> counties) async {
    try {
      // Upload all the counties along with their Image
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each category
      for (var county in counties) {

        // Get ImageData link from local assets
        final file = await storage.getImageDataFromAssets(county.image);

        // upload Image and Get its URL
        final url = await storage.uploadImageData('Counties', file, county.image);

        // assign URL to counties.image attribute
        county.image = url;

        // Storage County in Firebase
        await _db.collection('Counties').doc(county.id).set(county.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Valami hiba történt. Kérlek próbáld újra';
    }
  }
}