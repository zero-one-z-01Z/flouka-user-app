import '../../domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.image,
    required super.name,
    super.children = const [],
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    List<CategoryEntity> children = [];
    if (json['children'] != null && json['children'] is List) {
      List<CategoryModel> list = [];
      for (var i in json['children']) {
        list.add(CategoryModel.fromJson(i));
      }
      children = list;
    }
    return CategoryModel(
      id: json['id'],
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      children: children,
    );
  }
}
