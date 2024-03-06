enum EnvType {
  dev("dev-amorphie-backoffice.burgan.com.tr"),
  preprod("preprod-amorphie-backoffice.burgan.com.tr"),
  test("test-amorphie-backoffice.burgan.com.tr");

  final String url;

  const EnvType(this.url);

  bool get isDev => this == EnvType.dev;
  bool get isPreprod => this == EnvType.preprod;
  bool get isTest => this == EnvType.test;
}

class Environment {
  static EnvType _envType = EnvType.dev;

  static EnvType get type => _envType;

  static String get url => _envType.url;

  static void init() {
    Uri baseUri = Uri.base;
    baseUri.path;
    if (baseUri.host.contains("preprod")) {
      _envType = EnvType.preprod;
    } else if (baseUri.host.contains("test")) {
      _envType = EnvType.test;
    } else {
      _envType = EnvType.dev;
    }
  }
}
