import 'package:flouka/features/filters/domain/entity/filter_entity.dart';

class FilterModel extends FilterEntity {
  const FilterModel({required super.id, required super.title});

  factory FilterModel.fromJson(Map<String, dynamic> json) {
    return FilterModel(id: json['id'], title: json['title']);
  }
}
