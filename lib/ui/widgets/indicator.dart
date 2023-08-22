import 'package:admin/ui/style/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppIndicator extends StatelessWidget {
  const AppIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitCircle(
      color: KC.secondary,
    ));
  }
}
