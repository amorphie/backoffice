import '_.dart';

class ServiceConstants {
  //! HHS Api BEGIN
  static const String hhsApi = "hhs-api";

  static String get getHHS => "$hhsApi/s${ServiceConfig.apiVersion}/hhs";

  //! HHS Api BEGIN

  //! HBH Api BEGIN
  static const String hbhApi = "hbh";

  //static String get getConsent => "$hbhApi/s${ServiceConfig.apiVersion}/hesap-bilgisi-rizasi";
  //static String get postConsent => "$hbhApi/s${ServiceConfig.apiVersion}/hesap-bilgisi-rizasi";
  //static String get getAccount => "$hbhApi/s${ServiceConfig.apiVersion}/hesaplar";
  //static String get postAccount => "$hbhApi/s${ServiceConfig.apiVersion}/hesaplar";
  //static String get getBalance => "$hbhApi/s${ServiceConfig.apiVersion}/bakiye";
  //static String get getTransactions => "$hbhApi/s${ServiceConfig.apiVersion}/islemler";

  //! HBH Api END
}
