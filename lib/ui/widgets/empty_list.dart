import '../helpers/exporter.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.list, size: 60, color: KC.primary),
          SizedBox(height: 20),
          Text("No items yet"),
        ],
      ),
    );
  }
}
