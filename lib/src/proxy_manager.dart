import 'dart:io';

class ProxyManager {
  /// Set a proxy to bypass network restrictions
  static void setProxy(String proxyAddress) {
    HttpOverrides.global = _MyHttpOverrides(proxyAddress);
  }
}

class _MyHttpOverrides extends HttpOverrides {
  final String proxyAddress;

  _MyHttpOverrides(this.proxyAddress);

  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return "PROXY $proxyAddress;";
      };
  }
}
