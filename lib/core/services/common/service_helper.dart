import '_.dart';

class ServiceHelper {
  // static Uri getURl(String endpoint) {
  //   return Uri.parse("${ServiceConfig.baseUrl}$endpoint");
  // }

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

enum BaseUrl {
  tag("https://test-amorphie-tag.burgan.com.tr/"),
  resource("https://test-amorphie-resource.burgan.com.tr/"),
  user("https://test-amorphie-fact-user.burgan.com.tr/");

  final String url;
  const BaseUrl(this.url);

  Uri getURl(String endpoint) {
    return Uri.parse("$url$endpoint");
  }
}
