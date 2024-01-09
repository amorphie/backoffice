class DemoMaturity {
  final String? maturity;
  final String? text;

  DemoMaturity({required this.maturity, required this.text});
}

class DemoMaturityList {
  List<DemoMaturity>? items;

  DemoMaturityList.fromJson(Map<String, dynamic> json) {
    items = json.entries.map((entry) => DemoMaturity(maturity: entry.key, text: entry.value)).toList();
  }
}
