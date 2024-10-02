import 'dart:io';

class DeviceUtility {
  DeviceUtility._();

  static Future<bool> hasInternetConnection() async {
    try {
      // Look up the IP addresses for the hostname 'google.com'
      final result = await InternetAddress.lookup('google.com');
      // Check if the lookup returned any results and if the first result has a non-empty rawAddress
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
