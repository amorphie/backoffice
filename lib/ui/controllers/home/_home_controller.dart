import '../../helpers/exporter.dart';

class HomeControllerMixin {
  RxList<DisplayViewModel> displayList = <DisplayViewModel>[].obs;

  Rx<DisplayViewModel> _displayView = DisplayViewModel.init().obs;
  DisplayViewModel get displayView => _displayView.value;
  setDisplayView(DisplayViewModel _) => _displayView.value = _;
  deselectEntity() => setDisplayView(DisplayViewModel.init());
  equalDisplayView(DisplayViewModel? _) => _displayView.value == _;

  bool get hasEntity => !displayView.isBlank;
  addData(DisplayViewModel _) {
    setDisplayView(_);
    displayList.add(_);
  }

  subtractData(DisplayViewModel model) {
    int index = displayList.indexWhere((element) => element == model);
    if (hasEntity) {
      if (index > -1 && displayList.length > 1) {
        if (model == displayView) setDisplayView(displayList[index - 1]);
      } else {
        deselectEntity();
      }
    }
    displayList.remove(model);
  }

  RxBool _addDataLoading = false.obs;
  bool get addDataLoading => _addDataLoading.value;
  setAddDataLoading(bool _) => _addDataLoading.value = _;

  RxBool _filterView = false.obs;
  bool get filterView => _filterView.value;
  setFilterView(bool _) => _filterView.value = _;

  RxInt _rowPerPage = 10.obs;
  int get rowPerPage => _rowPerPage.value;
  // set rowPerPage(int value) => _rowPerPage.value = value;
  setRowPerPage(int value) => _rowPerPage.value = value;
  rowPerPageReset() => _rowPerPage.value = 10;
}
