import 'package:cloud_firestore/cloud_firestore.dart';

class FishingSpotModel {
  final String id;
  String placeName;
  String waterType;
  String gpsCoordinates;
  int numberOfSpots;
  String uploadedBy;
  List<String> imageUrls;

  FishingSpotModel({
    required this.id,
    required this.placeName,
    required this.waterType,
    required this.gpsCoordinates,
    required this.numberOfSpots,
    required this.uploadedBy,
    required this.imageUrls,
  });

  /// Helper function to format GPS coordinates, if needed
  String get formattedGpsCoordinates => gpsCoordinates;

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'placeName': placeName,
      'waterType': waterType,
      'gpsCoordinates': gpsCoordinates,
      'numberOfSpots': numberOfSpots,
      'uploadedBy': uploadedBy,
      'images': imageUrls,
    };
  }

  /// Factory method to create a FishingSpotModel from a Firebase document snapshot
  factory FishingSpotModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return FishingSpotModel(
      id: document.id,
      placeName: data['placeName'] ?? '',
      waterType: data['waterType'] ?? '',
      gpsCoordinates: data['gpsCoordinates'] ?? '',
      numberOfSpots: data['numberOfSpots'] ?? 0,
      uploadedBy: data['uploadedBy'] ?? '',
      imageUrls: List<String>.from(data['images'] ?? []),
    );
  }
}
