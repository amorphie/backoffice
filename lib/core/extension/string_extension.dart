extension StringExt on String {
  bool onFilter(String f) => toLowerCase().contains(f.toLowerCase());
}

extension StringNullExt on String? {
  bool onFilter(String f) => (this ?? "").onFilter(f);
}
