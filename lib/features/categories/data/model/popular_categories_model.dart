import '../../domain/entity/popular_categories_entity.dart';

class PopularCategoriesModel extends PopularCategoriesEntity {
  PopularCategoriesModel({
    required super.id,
    required super.image,
    required super.name,
    required super.startDate,
    required super.endDate,
  });

  factory PopularCategoriesModel.fromJson(Map<String, dynamic> json) {
    return PopularCategoriesModel(
      id: json['id'],
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
    );
  }
}
