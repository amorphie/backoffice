enum FilterType {
  query,
  reference;

  const FilterType();
  String toMap() => this.name;
  factory FilterType.fromMap(var data) {
    switch (data) {
      case "query":
        return FilterType.query;

      case "reference":
        return FilterType.reference;

      default:
        return FilterType.query;
    }
  }
}
