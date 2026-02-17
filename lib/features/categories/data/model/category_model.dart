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
      children = List<CategoryEntity>.from(
        (json['children'] as List).map((x) => CategoryModel.fromJson(x)),
      );
    }
    return CategoryModel(
      id: json['id'],
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      children: children,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'children': children
          .map(
            (child) => child is CategoryModel
                ? child.toJson()
                : {'id': child.id, 'name': child.name, 'image': child.image},
          )
          .toList(),
    };
  }
}
