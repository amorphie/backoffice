import '_.dart';

class ServiceHelper {
  static Uri getURl(String endpoint) {
    return Uri.parse("${ServiceConfig.baseUrl}$endpoint");
  }

  static Map<String, String> get headers => {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded'
      };
  static Map<String, String> get headersAuth => {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        //'Authorization': 'Bearer  ${Token.token}'
      };
}
