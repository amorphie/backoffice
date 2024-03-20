enum UISearchLayout {
  full,
  none;

  factory UISearchLayout.fromMap(String value) {
    switch (value) {
      case "full":
        return UISearchLayout.full;
      default:
        return UISearchLayout.none;
    }
  }
  String toMap() => name;
}
