import '../../../helpers/exporter.dart';
import 'layouts/ui_workflow_model.dart';

class EntityModel {
  String name;
  UIWorkflowModel workflow;
  SearchLayout search;
  DisplayLayoutModel? display;
  EntityModel({
    required this.name,
    required this.workflow,
    required this.search,
    this.display,
  });

  factory EntityModel.init() => EntityModel(name: "", workflow: UIWorkflowModel.init(), search: SearchLayout.init());
  bool get hasFilter => search.filter != null;

  EntityModel copyWith({
    String? name,
    UIWorkflowModel? workflow,
    SearchLayout? search,
    DisplayLayoutModel? display,
  }) {
    return EntityModel(
      name: name ?? this.name,
      workflow: workflow ?? this.workflow,
      search: search ?? this.search,
      display: display ?? this.display,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'workflow': workflow.toMap(),
      'search': search.toMap(),
      'display': display?.toMap(),
    };
  }

  factory EntityModel.fromMap(Map<String, dynamic> map) {
    return EntityModel(
      name: map['name'] as String,
      workflow: UIWorkflowModel.fromMap(map['workflow'] as Map<String, dynamic>),
      search: SearchLayout.fromMap(map['search'] as Map<String, dynamic>),
      display: map['display'] != null ? DisplayLayoutModel.fromMap(map['display'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EntityModel.fromJson(String source) => EntityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EntityModel(name: $name, workflow: $workflow, search: $search, display: $display)';
  }

  @override
  bool operator ==(covariant EntityModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.workflow == workflow && other.search == search && other.display == display;
  }

  @override
  int get hashCode {
    return name.hashCode ^ workflow.hashCode ^ search.hashCode ^ display.hashCode;
  }
}
