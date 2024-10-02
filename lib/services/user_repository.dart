import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Repository for managing user-related data operations.
class UserRepository extends GetxController {
  /// Singleton instance of [UserRepository].
  static UserRepository get instance => Get.find();

  /// Instance of [FirebaseFirestore] for accessing Firestore database.
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Fetches the list of users from Firestore based on the search query.
  Future<dynamic> getUsers(String query) async {
    try {
      // If query is empty, return an empty list instead of making a Firestore query
      if (query.isEmpty) return [];

      // Fetch user data from 'users' collection using a Firestore query with prefix matching
      final QuerySnapshot<Map<String, dynamic>> snapshot = await _firestore
          .collection('users')
          .where('first_name', isGreaterThanOrEqualTo: query)
          .where('first_name',
              isLessThanOrEqualTo: '$query\uf8ff') // For prefix search
          .get();

      return snapshot;
    } catch (e) {
      // Log error message (optional)
      debugPrint("Error fetching users: $e");

      // Return a user-friendly error message
      return "An unexpected error occurred. Please try again.";
    }
  }
}
