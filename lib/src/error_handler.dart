import 'network_checker.dart';

class ErrorHandler {
  /// Check if the current error is due to network restrictions
  static Future<void> handleNetworkError(
      Function onBlocked, Function onNetworkError) async {
    bool isBlocked = await NetworkChecker.isBlocked();
    if (isBlocked) {
      onBlocked();
    } else {
      onNetworkError();
    }
  }

  /// Handle API errors by suggesting alternative solutions
  static Future<void> handleApiError(
      Function onApiBlocked, Function onOtherError) async {
    // Example: check if API call failed due to a ban
    bool apiBlocked = await NetworkChecker.isApiBlocked();
    if (apiBlocked) {
      onApiBlocked();
    } else {
      onOtherError();
    }
  }
}
