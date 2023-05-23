extension MatchsExtension on String {
  String templateWithData(Map<String, dynamic> data, [bool nullStringAdd = false]) {
    RegExp desen = RegExp(r'{{(.*?)}}');
    String result = this;

    Iterable<Match> eslesenler = desen.allMatches(result);

    for (Match eslesen in eslesenler) {
      String txt = substring(eslesen.start + 2, eslesen.end - 2).trim();
      String changed = substring(eslesen.start, eslesen.end);
      result = result.replaceAll(changed, data[txt] ?? (nullStringAdd ? txt : ""));
    }
    return result;
  }
}
