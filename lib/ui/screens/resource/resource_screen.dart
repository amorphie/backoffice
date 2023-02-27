// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:admin/core/models/resource.dart';
import 'package:admin/core/utils/responsive.dart';
import 'package:admin/ui/tables/table_base.dart';

import '../../style/paddings.dart';

class ResourceScreen extends StatelessWidget {
  final ResourceModel model;
  final List<ResourceModel> list;
  final Function(ResourceModel model) selectModel;
  const ResourceScreen({
    Key? key,
    required this.model,
    required this.list,
    required this.selectModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          primary: false,
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: defaultPadding),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        SizedBox(height: defaultPadding),

                        TableBase(
                            items: list,
                            onSelect: (c) {
                              selectModel(c as ResourceModel);
                            },
                            onFilter: (item) {}), //!YENİ
                        if (Responsive.isMobile(context))
                          SizedBox(height: defaultPadding),
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
