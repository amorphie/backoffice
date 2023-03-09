class MyDataTableCell {
  String text;
  String title;
  MyDataTableCell({
    required this.text,
    required this.title,
  });
  factory MyDataTableCell.set(String title, String text) => MyDataTableCell(text: text, title: title);
}

class MyDataTableRow<T> {
  List<MyDataTableCell> cells;
  Function(T item) onPressed;
  T item;
  MyDataTableRow({
    required this.cells,
    required this.onPressed,
    required this.item,
  });
}
