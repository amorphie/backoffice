enum UIDisplayLayout {
  compact,
  none;

  factory UIDisplayLayout.fromMap(String value) {
    switch (value) {
      case "compact":
        return UIDisplayLayout.compact;
      default:
        return UIDisplayLayout.none;
    }
  }
  String toMap() => name;
}
/* Liste detay sayfasını temsilen eklenen kısım ui display */