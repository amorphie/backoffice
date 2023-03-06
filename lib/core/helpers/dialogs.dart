import 'package:admin/ui/pages/resource/resource_add_page.dart';
import 'package:admin/ui/pages/role/role_add_page.dart';
import 'package:admin/ui/pages/tag/tag_add_page.dart';
import 'package:admin/ui/pages/user/user_edit_page.dart';

import '../export/_.dart';

Future<void> tagPopUp(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Edit User', style: TextStyle(color: Colors.black)),
        content: const Text(
            'Ozan Deniz Demirtaş\n'
            'retail-customer, bank-staff\n',
            style: TextStyle(color: Colors.black87, fontSize: 13)),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Save',
                style: TextStyle(color: KC.secondary, fontSize: 13)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Close',
                style: TextStyle(color: Colors.redAccent, fontSize: 13)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> addUserPopUp(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
            width: MediaQuery.of(context).size.width / 2, child: UserAddPage()),
      );
    },
  );
}

Future<void> addResourcePopUp(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: ResourceAddPage()),
      );
    },
  );
}

Future<void> addTagPopUp(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
            width: MediaQuery.of(context).size.width / 2, child: TagAddPage()),
      );
    },
  );
}

Future<void> addRolePopUp(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        content: SizedBox(
            width: MediaQuery.of(context).size.width / 2, child: RoleAddPage()),
      );
    },
  );
}

Future<void> editUser(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        buttonPadding: EdgeInsets.zero,
        iconPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.zero,
        title: const Text('AlertDialog Title'),
        content: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: UserEditPage()),
      );
    },
  );
}
