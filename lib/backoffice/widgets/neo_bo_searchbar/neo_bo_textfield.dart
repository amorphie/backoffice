// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class NeoBoSearchTextfield extends StatelessWidget {
  final Future Function(String val) onSearch;

  const NeoBoSearchTextfield({
    Key? key,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (val) async {
        if (val.length > 2) {
          await onSearch(val);
        }
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.search),
        labelText: 'Search',
      ),
    );
  }
}
