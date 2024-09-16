import 'package:cloud_firestore/cloud_firestore.dart';

class FishingSpotModel {
  final String id;
  String placeName;
  String waterType;
  String settlementName;
  String gpsCoordinates;
  int numberOfSpots;
  String uploadedBy;
  List<String> imageUrls;
  String countyId; // Új mező a megyéhez való hivatkozáshoz

  FishingSpotModel({
    required this.id,
    required this.placeName,
    required this.waterType,
    required this.settlementName,
    required this.gpsCoordinates,
    required this.numberOfSpots,
    required this.uploadedBy,
    required this.imageUrls,
    required this.countyId, // Megye ID-ja
  });

  /// copyWith metódus a countyId frissítéséhez
  FishingSpotModel copyWith({
    String? countyId,
  }) {
    return FishingSpotModel(
      id: this.id,
      placeName: this.placeName,
      waterType: this.waterType,
      settlementName: this.settlementName,
      gpsCoordinates: this.gpsCoordinates,
      numberOfSpots: this.numberOfSpots,
      uploadedBy: this.uploadedBy,
      imageUrls: this.imageUrls,
      countyId: countyId ?? this.countyId,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'placeName': placeName,
      'waterType': waterType,
      'settlementName': settlementName,
      'gpsCoordinates': gpsCoordinates,
      'numberOfSpots': numberOfSpots,
      'uploadedBy': uploadedBy,
      'imageUrls': imageUrls,
      'countyId': countyId, // Megye ID-ja
    };
  }

  factory FishingSpotModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return FishingSpotModel(
      id: document.id,
      placeName: data['placeName'] ?? '',
      waterType: data['waterType'] ?? '',
      settlementName: data['settlementName'] ?? '',
      gpsCoordinates: data['gpsCoordinates'] ?? '',
      numberOfSpots: data['numberOfSpots'] ?? 0,
      uploadedBy: data['uploadedBy'] ?? '',
      imageUrls: List<String>.from(data['imageUrls'] ?? []),
      countyId: data['countyId'] ?? '', // Megye ID-ja
    );
  }
}

