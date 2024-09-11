import 'package:cloud_firestore/cloud_firestore.dart';

class CountyModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CountyModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
});

  /// Empty Helper Function
  static CountyModel empty() => CountyModel(id: '', name: '', image: '', isFeatured: false);

  /// Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from firebase to UserModel
  factory CountyModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return CountyModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return CountyModel.empty();
    }
  }
}