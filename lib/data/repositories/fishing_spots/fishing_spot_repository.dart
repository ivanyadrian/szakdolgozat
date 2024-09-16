import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../features/browsing/screens/upload_new_element/model/fishing_spot_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';


/// Repository class for fishing spot-related operations
class FishingSpotRepository extends GetxController {
  static FishingSpotRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Új horgászhely létrehozása a 'FishingSpots' kollekcióban
  Future<String> createFishingSpot(FishingSpotModel spot) async {
    try {
      // Ellenőrizzük, hogy a megye létezik-e
      final countyId = await _checkOrCreateCounty(spot.countyId);

      // Frissítjük a spot objektumot a countyId-val
      spot = spot.copyWith(countyId: countyId);

      // FishingSpot hozzáadása a 'FishingSpots' kollekcióhoz
      final fishingSpotRef = _db.collection('FishingSpots').doc();
      await fishingSpotRef.set(spot.toJson());
      return fishingSpotRef.id;

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Váratlan hiba történt. Kérlek próbáld meg újra';
    }
  }

  /// Megyék ellenőrzése, vagy új megye létrehozása
  Future<String> _checkOrCreateCounty(String countyName) async {
    try {
      // Lekérjük a megyét a Counties kollekcióból
      final countyQuery = await _db.collection('Counties')
          .where('name', isEqualTo: countyName)
          .limit(1)
          .get();

      // Ha létezik a megye, visszaadjuk annak ID-ját
      if (countyQuery.docs.isNotEmpty) {
        return countyQuery.docs.first.id;
      }

      // Ha nem létezik, létrehozzuk a megyét
      final countyRef = _db.collection('Counties').doc(); // Új dokumentum a Counties kollekcióban
      await countyRef.set({'name': countyName});
      return countyRef.id; // Visszaadjuk az új megye ID-ját

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Váratlan hiba történt. Kérlek próbáld meg újra';
    }
  }

  /// Képek feltöltése és URL-ek mentése
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

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Váratlan hiba történt. Kérlek próbáld meg újra';
    }
  }

  /// Horgászhely frissítése a képek URL-jeivel
  Future<void> updateFishingSpotImages(String spotId, List<String> imageUrls) async {
    try {
      final fishingSpotRef = _db.collection('FishingSpots').doc(spotId);
      await fishingSpotRef.update({'imageUrls': imageUrls});

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Váratlan hiba történt. Kérlek próbáld meg újra';
    }
  }

  /// Megyék lekérése
  Future<List<String>> getAllCounties() async {
    try {
      final snapshot = await _db.collection('Counties').get();
      return snapshot.docs.map((doc) => doc['name'] as String).toList();

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Váratlan hiba történt. Kérlek próbáld meg újra';
    }
  }
}
