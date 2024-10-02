import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.contactNumber,
  });

  final String? id;
  final String? firstName;
  final String? lastName;
  final String? city;
  final String? contactNumber;

  // Factory method to create a UserModel from Firestore DocumentSnapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
    final data = documentSnapshot.data(); // Retrieve the map data from snapshot

    return UserModel(
      id: documentSnapshot.id, // Using document ID as 'id'
      firstName: data?["first_name"] ?? '', // Defaults to empty string if null
      lastName: data?["last_name"] ?? '',
      city: data?["city"] ?? '',
      contactNumber: data?["contact_number"] ?? '',
    );
  }

  // Convert UserModel to JSON for uploading to Firestore or other purposes
  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "city": city,
        "contact_number": contactNumber,
      };

  // Override toString method for easy printing/logging
  @override
  String toString() {
    return "$id, $firstName, $lastName, $city, $contactNumber";
  }
}
