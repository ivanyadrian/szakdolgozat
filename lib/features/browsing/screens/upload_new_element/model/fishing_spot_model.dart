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
  String countyId; // Megye ID-ja
  String countyName; // Megye neve
  String description; // Új mező a leíráshoz

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
    required this.countyName, // Megye neve
    required this.description, // Megye ID-ja
  });

  // Update the copyWith method to include countyName
  FishingSpotModel copyWith({
    String? countyId,
    String? countyName,
    String? description,
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
      countyName: countyName ?? this.countyName, // Update countyName
      description: description ?? this.description, // Update description
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
      'countyId': countyId,
      'countyName': countyName, // Add countyName to JSON
      'description': description, // Add description to JSON
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
      countyId: data['countyId'] ?? '',
      countyName: data['countyName'] ?? '', // Get countyName from data
      description: data['description'] ?? 'Nincs megadva leírás', // Add description from data
    );
  }
}


