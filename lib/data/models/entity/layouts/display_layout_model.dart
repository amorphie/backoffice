// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../../ui/helpers/exporter.dart';

class DisplayLayoutModel {
  TitleModel? summaryTemplate;
  TitleModel? detailTemplate;
  List<DisplayTabModel>? tabs;
  DisplayLayoutModel({
    this.summaryTemplate,
    this.detailTemplate,
    this.tabs,
  });

  DisplayLayoutModel copyWith({
    TitleModel? summaryTemplate,
    TitleModel? detailTemplate,
    List<DisplayTabModel>? tabs,
  }) {
    return DisplayLayoutModel(
      summaryTemplate: summaryTemplate ?? this.summaryTemplate,
      detailTemplate: detailTemplate ?? this.detailTemplate,
      tabs: tabs ?? this.tabs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'summaryTemplate': summaryTemplate?.toMap(),
      'detailTemplate': detailTemplate?.toMap(),
      'tabs': tabs?.map((x) => x.toMap()).toList(),
    };
  }

  factory DisplayLayoutModel.fromMap(Map<String, dynamic> map) {
    return DisplayLayoutModel(
      summaryTemplate: map['summaryTemplate'] != null ? TitleModel.fromMap(map['summaryTemplate'] as Map<String, dynamic>) : null,
      detailTemplate: map['detailTemplate'] != null ? TitleModel.fromMap(map['detailTemplate'] as Map<String, dynamic>) : null,
      tabs: map['tabs'] != null
          ? List<DisplayTabModel>.from(
              (map['tabs']).map<DisplayTabModel?>(
                (x) => DisplayTabModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DisplayLayoutModel.fromJson(String source) => DisplayLayoutModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DisplayLayoutModel( summaryTemplate: $summaryTemplate, detailTemplate: $detailTemplate, tabs: $tabs)';
  }

  @override
  bool operator ==(covariant DisplayLayoutModel other) {
    if (identical(this, other)) return true;

    return other.summaryTemplate == summaryTemplate && other.detailTemplate == detailTemplate && listEquals(other.tabs, tabs);
  }

  @override
  int get hashCode {
    return summaryTemplate.hashCode ^ detailTemplate.hashCode ^ tabs.hashCode;
  }
}
