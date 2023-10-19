class ServiceHelper {
  // static Uri getURl(String endpoint) {
  //   return Uri.parse("${ServiceConfig.baseUrl}$endpoint");
  // }

  static Map<String, String> get headers => {'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded'};
  static Map<String, String> get headersAuth => {
        'Accept': 'application/json',
        'Content-Type': 'application/x-www-form-urlencoded',
        //'Authorization': 'Bearer  ${Token.token}'
      };
}

enum BaseUrl {
  tag("https://test-amorphie-tag.PROJECT_BASE_URL/"),
  resource("https://test-amorphie-resource.PROJECT_BASE_URL/"),
  user("https://test-amorphie-fact-user.PROJECT_BASE_URL/");

  final String url;
  const BaseUrl(this.url);

  Uri getURl(String endpoint) {
    return Uri.parse("$url$endpoint");
  }
}
