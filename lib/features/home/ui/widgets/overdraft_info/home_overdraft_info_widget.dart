import 'package:flutter/material.dart';
import 'package:backoffice/core/dependency_injection/dependency_injection.dart';
import 'package:backoffice/core/managers/parameter_manager/neo_parameter_manager.dart';

abstract class _Constant {
  static const availableBalance = "available-balance";
  static const currency = "currency";
  static const pageId = "home";
}

class HomeOverdraftInfoWidget extends StatelessWidget {
  const HomeOverdraftInfoWidget({
    required this.title,
    required this.closeAccountButtonText,
    required this.updateLimitButtonText,
    Key? key,
  }) : super(key: key);

  final String title;
  final String closeAccountButtonText;
  final String updateLimitButtonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(child: Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          _buildButton(
            closeAccountButtonText,
            onPressed: () {
              // STOPSHIP: Delete this test condition
              getIt.get<NeoParameterManager>().writeToCache(_Constant.pageId, {
                _Constant.availableBalance: 111,
                _Constant.currency: 'TRL',
              });
            },
          ),
          _buildButton(
            updateLimitButtonText,
            onPressed: () async {
              // STOPSHIP: Delete this test condition
              getIt.get<NeoParameterManager>().writeToCache(_Constant.pageId, {
                _Constant.availableBalance: 0,
                _Constant.currency: 'TRL',
              });
            },
          ),
        ],
      ),
    );
  }

  Padding _buildButton(String buttonText, {required Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white10.withAlpha(150)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        ),
        onPressed: () => onPressed.call(),
        child: Text(buttonText),
      ),
    );
  }
}
