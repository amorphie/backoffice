import '../helpers/exporter.dart';

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
