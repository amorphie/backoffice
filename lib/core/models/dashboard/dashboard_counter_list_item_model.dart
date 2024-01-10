import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dashboard_counter_list_item_model.g.dart';

@JsonSerializable()
class DashboardCounterListItemModel extends Equatable {
  final String title;
  final int value;

  const DashboardCounterListItemModel({
    required this.title,
    required this.value,
  });

  factory DashboardCounterListItemModel.fromJson(Map<String, dynamic> json) => _$DashboardCounterListItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$DashboardCounterListItemModelToJson(this);

  @override
  List<Object?> get props => [title, value];

  DashboardCounterListItemModel copyWith({
    String? title,
    int? value,
  }) {
    return DashboardCounterListItemModel(
      title: title ?? this.title,
      value: value ?? this.value,
    );
  }

  @override
  String toString() => 'DashboardCounterListItemModel(title: $title, value: $value)';

  @override
  bool operator ==(covariant DashboardCounterListItemModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.value == value;
  }

  @override
  int get hashCode => title.hashCode ^ value.hashCode;
}
