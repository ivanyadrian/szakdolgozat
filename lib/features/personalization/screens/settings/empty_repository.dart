import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UploadImageRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<String> uploadImage(File image) async {
    try {
      // Kép feltöltése a Firebase Storage-ba
      final ref = FirebaseStorage.instance.ref('Banners/${image.path.split('/').last}');
      await ref.putFile(image);
      String downloadUrl = await ref.getDownloadURL();

      // Kép URL mentése a Firestore-ba
      await _db.collection('Banners').add({
        'imageUrl': downloadUrl,
      });

      return downloadUrl;
    } catch (e) {
      throw 'Hiba történt a kép feltöltése során: $e';
    }
  }
}
