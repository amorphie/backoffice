import '../../helpers/exporter.dart';

class DisplayControllerMixin {
  String? _tag;
  String? get tag => _tag;
  setTag(String? _) => _tag = _;

  Rx<DisplayLayoutModel> _displayLayout = DisplayLayoutModel().obs;
  DisplayLayoutModel get displayLayout => _displayLayout.value;
  setDisplayLayout(DisplayLayoutModel _) => _displayLayout.value = _;

  RxMap<String, dynamic> _displayData = <String, dynamic>{}.obs;
  Map<String, dynamic> get displayData => Map<String, dynamic>.of(_displayData);
  setDisplayData(Map<String, dynamic> _) => _displayData.value = _;
  reset() => _displayData.value = <String, dynamic>{};

  RxMap<String, dynamic> _templates = <String, dynamic>{}.obs;
  Map<String, dynamic> get templates => Map<String, dynamic>.of(_templates);
  addTemplates(Map<String, dynamic> _) {
    _templates.addAll(_);
    _templates.refresh();
  }

  clearTemplates() {
    _templates.clear();
    _templates.refresh();
  }

  RxMap<String, dynamic> _searchModels = <String, dynamic>{}.obs;
  Map<String, dynamic> get searchModels => Map<String, dynamic>.of(_searchModels);
  addSearchModels(Map<String, dynamic> _) {
    _searchModels.value = _;
    _searchModels.refresh();
  }

  RxList<HistoryWorkflowModel> _historyWorkflows = <HistoryWorkflowModel>[].obs;
  List<HistoryWorkflowModel> get historyWorkflows => List<HistoryWorkflowModel>.of(_historyWorkflows);
  historyWorkflowsAddItem(HistoryWorkflowModel item) {
    _historyWorkflows.add(item);
    _historyWorkflows.refresh();
  }

  historyWorkflowsClear() {
    _historyWorkflows.clear();
    _historyWorkflows.refresh();
  }

  Rx<EntityModel> _entity = EntityModel.init().obs;
  EntityModel get entity => _entity.value;
  setEntity(EntityModel _) => _entity.value = _;

  int get tabCount {
    return (displayLayout.tabs?.length ?? 0) + 1 + (entity.workflow.history ? 1 : 0);
  }
}
