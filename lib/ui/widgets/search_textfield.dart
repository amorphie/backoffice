import '../helpers/exporter.dart';

class Searchtf extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final String labelText;
  final int? maxLenght;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  const Searchtf({
    super.key,
    required this.inputFormatters,
    this.hintText,
    required this.labelText,
    this.maxLenght,
    this.validator,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: TextField(
        cursorColor: KC.primary,
        maxLength: maxLenght,
        inputFormatters: inputFormatters,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: "Search",
          prefixIconColor: KC.primary,
          prefixIcon: Icon(Icons.search),
          iconColor: KC.secondary,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: KC.secondary, width: 1.5),
          ),
          focusColor: Colors.redAccent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
