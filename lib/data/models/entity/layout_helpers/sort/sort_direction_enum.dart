enum SortDirection {
  asc,
  desc;

  const SortDirection();

  String toMap() {
    switch (this) {
      case SortDirection.asc:
        return '0';
      case SortDirection.desc:
        return '1';
      default:
        throw Exception('Invalid SortDirection');
    }
  }

  factory SortDirection.fromMap(String value) {
    switch (value) {
      case '0':
        return SortDirection.asc;
      case '1':
        return SortDirection.desc;
      default:
        throw Exception('Invalid SortDirection');
    }
  }
}
