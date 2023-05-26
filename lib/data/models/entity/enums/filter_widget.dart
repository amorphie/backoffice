enum FilterWidget {
  textField,
  dropdown;

  const FilterWidget();
  String toMap() => this.name;
  factory FilterWidget.fromMap(var data) {
    switch (data) {
      case "text":
        return FilterWidget.textField;

      case "dropdown":
        return FilterWidget.dropdown;

      default:
        return FilterWidget.textField;
    }
  }
}
