import '../../domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.image,
    required super.name,
    required super.subCategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    List<CategoryEntity> subCategories = [];
    if (json['children'] != null) {
      subCategories = List<CategoryEntity>.from(
        json['children'].map((x) => CategoryModel.fromJson(x)),
      );
    }
    return CategoryModel(
      id: json['id'],
      image: json['image'],
      name: json['name'],
      subCategories: subCategories,
    );
  }
}
