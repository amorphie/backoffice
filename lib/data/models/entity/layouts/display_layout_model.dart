// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:admin/data/models/entity/layout_helpers/tab_model.dart';
import 'package:admin/data/models/entity/layout_helpers/title_model.dart';

class DisplayLayoutModel {
  String? workflow;
  String? url;

  String? name;
  bool? isDefault;
  String? title;
  TitleModel? summary_template;
  TitleModel? detail_template;
  bool? history;
  bool? state_manage;
  bool? running_workflows;
  bool? available_workflows;
  List<DisplayTabModel>? tabs;
  DisplayLayoutModel({
    this.workflow,
    this.url,
    this.name,
    this.isDefault,
    this.title,
    this.summary_template,
    this.detail_template,
    this.history,
    this.state_manage,
    this.running_workflows,
    this.available_workflows,
    this.tabs,
  });

  DisplayLayoutModel copyWith({
    String? workflow,
    String? url,
    String? name,
    bool? isDefault,
    String? title,
    TitleModel? summary_template,
    bool? history,
    bool? state_manage,
    bool? running_workflows,
    bool? available_workflows,
    List<DisplayTabModel>? tabs,
  }) {
    return DisplayLayoutModel(
      workflow: workflow ?? this.workflow,
      url: url ?? this.url,
      name: name ?? this.name,
      isDefault: isDefault ?? this.isDefault,
      title: title ?? this.title,
      summary_template: summary_template ?? this.summary_template,
      history: history ?? this.history,
      state_manage: state_manage ?? this.state_manage,
      running_workflows: running_workflows ?? this.running_workflows,
      available_workflows: available_workflows ?? this.available_workflows,
      tabs: tabs ?? this.tabs,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'workflow': workflow,
      'url': url,
      'name': name,
      'isDefault': isDefault,
      'title': title,
      'summary_template': summary_template?.toMap(),
      'detail_template': detail_template?.toMap(),
      'history': history,
      'state_manage': state_manage,
      'running_workflows': running_workflows,
      'available_workflows': available_workflows,
      'tabs': tabs?.map((x) => x.toMap()).toList(),
    };
  }

  factory DisplayLayoutModel.fromMap(Map<String, dynamic> map) {
    return DisplayLayoutModel(
      workflow: map['workflow'] != null ? map['workflow'] as String : "",
      url: map['url'] != null ? map['url'] as String : "",
      name: map['name'] != null ? map['name'] as String : "",
      isDefault: map['default'] != null ? map['default'] as bool : false,
      title: map['title'] != null ? map['title'] as String : "",
      summary_template: map['summary-template'] != null ? TitleModel.fromMap(map['summary-template'] as Map<String, dynamic>) : null,
      detail_template: map['detail-template'] != null ? TitleModel.fromMap(map['detail-template'] as Map<String, dynamic>) : null,
      history: map['history'] != null ? map['history'] as bool : false,
      state_manage: map['state-manager'] != null ? map['state-manager'] as bool : false,
      running_workflows: map['running-workflows'] != null ? map['running-workflows'] as bool : false,
      available_workflows: map['available-workflows'] != null ? map['available-workflows'] as bool : false,
      tabs: map['tabs'] != null
          ? List<DisplayTabModel>.from(
              (map['tabs']).map<DisplayTabModel?>(
                (x) => DisplayTabModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory DisplayLayoutModel.fromJson(String source) => DisplayLayoutModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DisplayLayoutModel(url: $url, name: $name, isDefault: $isDefault, title: $title, summary_template: $summary_template, history: $history, state_manage: $state_manage, running_workflows: $running_workflows, available_workflows: $available_workflows, tabs: $tabs)';
  }

  @override
  bool operator ==(covariant DisplayLayoutModel other) {
    if (identical(this, other)) return true;

    return other.url == url &&
        other.workflow == workflow &&
        other.name == name &&
        other.isDefault == isDefault &&
        other.title == title &&
        other.summary_template == summary_template &&
        other.detail_template == detail_template &&
        other.history == history &&
        other.state_manage == state_manage &&
        other.running_workflows == running_workflows &&
        other.available_workflows == available_workflows &&
        listEquals(other.tabs, tabs);
  }

  @override
  int get hashCode {
    return url.hashCode ^
        workflow.hashCode ^
        name.hashCode ^
        isDefault.hashCode ^
        title.hashCode ^
        summary_template.hashCode ^
        detail_template.hashCode ^
        history.hashCode ^
        state_manage.hashCode ^
        running_workflows.hashCode ^
        available_workflows.hashCode ^
        tabs.hashCode;
  }
}
