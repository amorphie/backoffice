enum DisplayTabType {
  none,
  render,
  search,
  formio,
  html,
  url,
  image,
  pdf,
  splitRow,
  splitColumn;

  const DisplayTabType();

  String toMap() => this.name;

  factory DisplayTabType.fromMap(String val) {
    switch (val) {
      case "render":
        return DisplayTabType.render;
      case "search":
        return DisplayTabType.search;
      case "splitRow":
        return DisplayTabType.splitRow;
      case "pdf":
        return DisplayTabType.pdf;
      case "formio":
        return DisplayTabType.formio;
      case "html":
        return DisplayTabType.html;
      case "url":
        return DisplayTabType.url;
      case "image":
        return DisplayTabType.image;
      case "splitColumn":
        return DisplayTabType.splitColumn;
      default:
        return DisplayTabType.none;
    }
  }
  bool get isNone => this == DisplayTabType.none;
  bool get isPdf => this == DisplayTabType.pdf;
  bool get isRender => this == DisplayTabType.render;
  bool get isHtml => this == DisplayTabType.html;
  bool get isSearch => this == DisplayTabType.search;
  bool get isFormio => this == DisplayTabType.formio;
  bool get isSplitRow => this == DisplayTabType.splitRow;
  bool get isSplitColumn => this == DisplayTabType.splitColumn;

  bool get isSplit => this.isSplitColumn || this.isSplitRow;
}
