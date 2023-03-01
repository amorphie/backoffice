// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:admin/core/export/_.dart';

import '../../../core/models/resource.dart';

class ResourceAddScreen extends StatefulWidget {
  final ResourceModel model;
  final Future Function(ResourceModel model) addPressed;
  final List<ResourceModel> list;
  const ResourceAddScreen({
    Key? key,
    required this.model,
    required this.addPressed,
    required this.list,
  }) : super(key: key);
  @override
  State<ResourceAddScreen> createState() => _ResourceAddScreenState();
}

class _ResourceAddScreenState extends State<ResourceAddScreen> {
  List<String> status = <String>['New', 'InProgress', 'Ready', 'Active'];

  late TextEditingController url;
  late TextEditingController statu;
  late TextEditingController type;

  @override
  void initState() {
    super.initState();
    url = TextEditingController(text: widget.model.url);
    statu = TextEditingController(text: widget.model.status);
    type = TextEditingController(text: widget.model.type.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 25),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Add User",
                style: TextStyle(
                    color: KC.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
          ),
          Divider(
            color: KC.primary,
            height: 30,
          ),
          SizedBox(height: defaultPadding),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: CommonTextField(
              labelText: "Url",
              keyboardType: TextInputType.number,
              controller: url,
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: CommonTextField(
              labelText: "Status",
              controller: statu,
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(height: 30),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: CommonTextField(
              labelText: "Type",
              controller: type,
              keyboardType: TextInputType.phone,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Expanded(
                      child: CommonButton(
                          title: "Save",
                          onPressed: () async {
                            ResourceModel user = ResourceModel(
                                url: url.text,
                                type: int.parse(type.text),
                                tags: [],
                                status: statu.text,
                                description: [],
                                displayName: [],
                                id: '3fa85f64-5717-4562-b3fc-2c963f66afa9');
                            await widget.addPressed(user);
                          },
                          color: KC.primary),
                    )),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                  child: Expanded(
                    child: CommonButton(
                        title: "Close",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: KC.primary),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
