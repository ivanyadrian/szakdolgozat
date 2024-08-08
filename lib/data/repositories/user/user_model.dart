import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:szakdolgozat_app/utils/formatters/formatter.dart';

class UserModel {
  // ahol final van, azokat nem lehet updatelni
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number
  String get formattedPhoneNumber => TFormatter.formatPhoneNumber(phoneNumber);

  /// static function to split full name into first and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// static funtion to generate a username from the full name
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName"; // Combine first and last name
    String usernameWithPrefix = "cwt_$camelCaseUsername"; // Add cwt_ prefix
    return usernameWithPrefix;
  }

  /// static function to create an empty user model
  static UserModel empty() => UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNumber: '', profilePicture: '');

  /// Convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Vezetéknév': firstName,
      'Keresztnév': lastName,
      'Felhasználónév': username,
      'Email': email,
      'Telefonszám': phoneNumber,
      'Profilkép': profilePicture,
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['Vezetéknév'] ?? '',
        lastName: data['Keresztnév'] ?? '',
        username: data['Felhasználónév'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['Telefonszám'] ?? '',
        profilePicture: data['Profilkép'] ?? '',
      );
    } else {
      throw Exception('A DocumentSnapshot nem tartalmaz felhasználói adatot');
    }
  }
}

