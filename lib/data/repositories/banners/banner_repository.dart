import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:szakdolgozat_app/utils/exceptions/firebase_exceptions.dart';
import 'package:szakdolgozat_app/utils/exceptions/format_exceptions.dart';
import 'package:szakdolgozat_app/utils/exceptions/platform_exceptions.dart';

import '../../../features/browsing/models/banner_model.dart';

class BannerRepository extends GetxController{

  /// Variable
  final _db = FirebaseFirestore.instance;

  /// Get all order related to current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('active', isEqualTo: true).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Valami hiba történt az adatok lekérése közben';
    }
  }

  /// Upload BANNERS TO THE cLOUD fIREBASE
}