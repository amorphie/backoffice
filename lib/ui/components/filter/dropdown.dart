// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:admin/data/models/entity/layout_helpers/filter_layout_model.dart';

class FilterDropdown extends StatelessWidget {
  final List list;
  final Function(dynamic value) onSelected;
  final FilterLayout filter;
  const FilterDropdown({
    Key? key,
    required this.list,
    required this.onSelected,
    required this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<dynamic>(
      items: list.map((e) => DropdownMenuItem<dynamic>(child: Text(e.toString()))).toList(),
      onChanged: (val) {},
    );
  }
}
