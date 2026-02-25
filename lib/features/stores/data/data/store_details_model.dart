import 'package:flouka/core/helper_function/convert.dart';
import 'package:flouka/features/stores/domain/entity/store_details_entity.dart';

class StoreDetailsModel extends StoreDetailsEntity {
  StoreDetailsModel({
    required super.id,
    required super.name,
    required super.image,
    required super.cover,
    required super.avgRating,
    required super.customersCount,
    required super.productsCount,
    required super.isFollowed,
  });
  factory StoreDetailsModel.fromJson(Map<String, dynamic> json) {
    return StoreDetailsModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      cover: json['cover'],
      avgRating: convertDataToNum(json['avg_rating']),
      customersCount: convertDataToNum(json['customers_count']),
      productsCount: convertDataToNum(json['products_count']),
      isFollowed: convertDataToBool(json['is_followed']),
    );
  }
}
