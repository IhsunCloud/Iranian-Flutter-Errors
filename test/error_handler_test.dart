import 'package:flutter_test/flutter_test.dart';
import 'package:iranian_errors/iranian_errors.dart';

void main() {
  test('Check network error handling', () async {
    await ErrorHandler.handleNetworkError(
      () => print('Network is blocked'),
      () => print('Network error'),
    );
  });
}
