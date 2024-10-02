import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:girman/config/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Utility {
  Utility._(); // Singleton class

  static openMailApp() async {
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: supportMail);
    if (!await launchUrl(emailLaunchUri,
        mode: LaunchMode.externalApplication)) {
      debugPrint('Sorry, failed to launch default mail application');
      Get.snackbar(
        'Error',
        'Sorry, failed to launch default mail application',
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(Icons.error_rounded),
      );
    }
  }
}
