enum DashboardType {
  counters,
  chart,
  tab,
  list;

  const DashboardType();
  String toMap() {
    return this.name;
  }

  factory DashboardType.fromMap(String value) {
    switch (value) {
      case 'counters':
        return DashboardType.counters;
      case 'chart':
        return DashboardType.chart;
      case 'tab':
        return DashboardType.tab;
      case 'list':
        return DashboardType.list;
      default:
        throw Exception('Invalid value for DashboardType: $value');
    }
  }
}
