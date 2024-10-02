import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girman/models/user_model.dart';
import 'package:girman/services/user_repository.dart';
import 'package:girman/utils/device_utility.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  // * ---------------------------------/ Variables /------------------------------

  final RxBool _isLoading = true.obs;
  final RxList<UserModel> _userList = <UserModel>[].obs;
  final TextEditingController searchController = TextEditingController();

  // * ---------------------------------/ Getters /--------------------------------

  bool get isLoading => _isLoading.value;
  List<UserModel> get userList => _userList;

  // * ---------------------------------/ Setters /--------------------------------

  set isLoading(bool status) => _isLoading.value = status;
  set userList(List<UserModel> newList) => _userList.value = newList;

  // ! ----------------------------------------------------------------------------------

  /// Fetches the list of users from the repository based on the search query.
  Future<void> getUsers() async {
    try {
      isLoading = true;

      // Check for internet connectivity
      final bool isConnected = await DeviceUtility.hasInternetConnection();
      if (!isConnected) {
        isLoading = false;

        // Show error message for no internet connection
        Get.snackbar(
          'Connection Error',
          'Internet connection not available.',
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error_rounded),
        );
        return;
      }

      // Fetch users from repository
      final response =
          await UserRepository.instance.getUsers(searchController.text.trim());

      // Handle if response is a string (error message)
      if (response is String) {
        isLoading = false;

        Get.snackbar(
          'Oh Snap!',
          response,
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error_rounded),
        );
        return;
      }

      // Parse and update userList if response contains valid data
      if ((response?.docs ?? []).isNotEmpty) {
        userList = [];
        for (var doc in response!.docs) {
          userList.add(UserModel.fromSnapshot(doc));
        }
      } else {
        userList = []; // Clear the list if no data found
      }

      isLoading = false;
    } catch (e) {
      debugPrint(e.toString());

      isLoading = false;
      Get.snackbar(
        'Error',
        'An unexpected error occurred. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.error_rounded),
      );
    }
  }
}
