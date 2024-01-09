class DemoMaturityRenewal {
  final String? renewal;
  final String? text;

  DemoMaturityRenewal({required this.renewal, required this.text});
}

class DemoMaturityRenewalList {
  List<DemoMaturityRenewal>? items;

  DemoMaturityRenewalList.fromJson(Map<String, dynamic> json) {
    items = json.entries.map((entry) => DemoMaturityRenewal(renewal: entry.key, text: entry.value)).toList();
  }
}
