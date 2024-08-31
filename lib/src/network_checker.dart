import 'dart:io';

class NetworkChecker {
  /// Check if the current network is blocked from accessing a specific URL
  static Future<bool> isBlocked({String url = 'https://www.google.com'}) async {
    try {
      final result = await InternetAddress.lookup(url);
      return result.isEmpty || result[0].rawAddress.isEmpty;
    } on SocketException catch (_) {
      return true;
    }
  }

  /// Check if the API is blocked due to sanctions
  static Future<bool> isApiBlocked(
      {String apiUrl = 'https://api.example.com'}) async {
    try {
      final result = await InternetAddress.lookup(apiUrl);
      return result.isEmpty || result[0].rawAddress.isEmpty;
    } on SocketException catch (_) {
      return true;
    }
  }
}
