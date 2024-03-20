import 'dart:developer';

extension MatchsExtension on String {
  dynamic jsWithData(Map<String, dynamic> data, [String Function(String key)? nullString]) {
    String txt = replaceAll(" ", "");
    dynamic result;
    if (txt.contains(".")) {
      /*
      . jsonda alt modellere ulaşmak için kullanılır
      data["user"]["name"] gibi bir değere ulaşabilmek 
      için {{user.name}} yazmak yeterli olacaktır.
       */
      var txtData = txt.split(".");
      var d = data;

      for (int i = 0; i < txtData.length; i++) {
        String txtWord = txtData[i];
        if (i == 0) {
          result = (d[txtWord] ?? "").toString();
          d = d[txtWord];
        } else {
          try {
            if (d[txtWord] != null) {
              if (d[txtWord] is Map) {
                d = d[txtWord];
              }
              result = (d[txtWord] ?? "").toString();

              // else if (d[txtWord] is String) {
              //   changeWord = d[txtWord].toString();
              // }
              /*
                eğer ki bir modelin en altındaki kısma ulaştıysak 
                ve daha aşağısını arıyorsak, ancak bu bir map değilse
                muhtemelen istediğimiz dataya erişmişizdir. 
                bu datayı almak risklidir ve tam istenen datayı bize vermeyebilir.
                yorum satırını kaldırmak riskli olabilir.
                 */
            } else {
              log("${d.keys.join(",")} in not match key '$txtWord'", name: "MatchsExtension");
            }
          } catch (e) {
            log(e.toString() + "\n" + d.toString() + "\n" + d[txtWord], name: "MatchsExtension");
          }
        }
      }
    } else {
      result = data[txt];
    }
    return result;
  }

  String templateWithData(Map<String, dynamic> data, [String Function(String key)? nullString]) {
    RegExp pattern = RegExp(r'{{(.*?)}}');
    String result = this;

    Iterable<Match> matches = pattern.allMatches(result);

    for (Match matchItem in matches) {
      String txt = substring(matchItem.start + 2, matchItem.end - 2).replaceAll(" ", "");
      //patternleri almak için kullanıyoruz
      String changed = substring(matchItem.start, matchItem.end);
      /*
      patternleri aldıktan sonra değiştireceğimiz string kısmı 
      buradan geliyor örn: "{{name}}" stringini dışarıdan gelen 
      string ile replace etmemizi sağlıyor
       */
      String changeWord = txt.jsWithData(data).toString();

      if (changeWord.isEmpty && nullString != null) {
        changeWord = nullString(txt);
        //Eğer ki text boş ise eşleşmeyen datayı geri dönderip debug etme şansımız oluşur.
      }
      result = result.replaceAll(changed, changeWord);
    }
    return result;
  }
}
