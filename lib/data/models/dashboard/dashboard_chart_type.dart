enum ChartType {
  pie,
  line,
  bar;

  const ChartType();
  String toMap() {
    return this.name;
  }

  factory ChartType.fromMap(String value) {
    switch (value) {
      case 'pie':
        return ChartType.pie;
      case 'line':
        return ChartType.line;
      case 'bar':
        return ChartType.bar;
      default:
        throw Exception('Invalid value for ChartType: $value');
    }
  }
}
