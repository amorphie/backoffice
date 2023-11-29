// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../helpers/exporter.dart';

class EntityModel {
  String url;
  String name;
  String workflow;
  String titleTemplate;
  SearchLayout? search;
  DeleteLayout? delete;
  DisplayLayoutModel? display;
  EntityModel({
    required this.url,
    required this.name,
    required this.workflow,
    required this.titleTemplate,
    this.search,
    this.delete,
    this.display,
  });
  factory EntityModel.init() => EntityModel(name: "", workflow: "", titleTemplate: "", url: "");
  bool get hasFilter => search?.filter != null;
  EntityModel copyWith({
    String? url,
    String? name,
    String? workflow,
    String? titleTemplate,
    SearchLayout? search,
    DeleteLayout? delete,
    DisplayLayoutModel? display,
  }) {
    return EntityModel(
      url: url ?? this.url,
      name: name ?? this.name,
      workflow: workflow ?? this.workflow,
      titleTemplate: titleTemplate ?? this.titleTemplate,
      search: search ?? this.search,
      delete: delete ?? this.delete,
      display: display ?? this.display,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'name': name,
      'workflow': workflow,
      'titleTemplate': titleTemplate,
      'search': search?.toMap(),
      'delete': delete?.toMap(),
      'display': display?.toMap(),
    };
  }

  factory EntityModel.fromMap(Map<String, dynamic> map) {
    return EntityModel(
      url: map['url'] as String,
      name: map['name'] as String,
      workflow: map['workflow'] as String,
      titleTemplate: map['titleTemplate'] as String,
      search: map['search'] != null ? SearchLayout.fromMap(map['search'] as Map<String, dynamic>) : null,
      delete: map['delete'] != null ? DeleteLayout.fromMap(map['delete'] as Map<String, dynamic>) : null,
      display: map['display'] != null ? DisplayLayoutModel.fromMap(map['display'] as Map<String, dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EntityModel.fromJson(String source) => EntityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EntityModel(url: $url, name: $name, workflow: $workflow, titleTemplate: $titleTemplate, search: $search, delete: $delete, display: $display)';
  }

  @override
  bool operator ==(covariant EntityModel other) {
    if (identical(this, other)) return true;

    return other.url == url &&
        other.name == name &&
        other.workflow == workflow &&
        other.titleTemplate == titleTemplate &&
        other.search == search &&
        other.delete == delete &&
        other.display == display;
  }

  @override
  int get hashCode {
    return url.hashCode ^ name.hashCode ^ workflow.hashCode ^ titleTemplate.hashCode ^ search.hashCode ^ delete.hashCode ^ display.hashCode;
  }
}
