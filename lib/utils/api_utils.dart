class APIUtils {
  static const String _API_URL = "http://192.168.10.1:8082";
  static const Map<String, String> REQUEST_HEADER_UNAUTHENTICATED = {
    'Content-Type': 'application/json'
  };
  // ignore: non_constant_identifier_names
  static Map<String, String> REQUEST_HEADER_AUTHENTICATED = {
    'Content-Type': 'application/json'
  };
  static String generateUrl(String url) {
    return _API_URL + "/$url";
  }
}
