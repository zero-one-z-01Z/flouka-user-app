import '../../domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({required super.id, required super.image, required super.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
    );
  }
}
