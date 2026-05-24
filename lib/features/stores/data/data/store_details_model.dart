import 'package:flouka/core/helper_function/convert.dart';
import 'package:flouka/features/stores/domain/entity/store_details_entity.dart';

class StoreDetailsModel extends StoreDetailsEntity {
  StoreDetailsModel({
    required super.id,
    required super.name,
    required super.image,
    required super.cover,
    required super.bio,
    required super.avgRating,
    required super.customersCount,
    required super.productsCount,
    required super.isFollowed,
  });
  factory StoreDetailsModel.fromJson(Map<String, dynamic> json) {
    return StoreDetailsModel(
      id: json['id'],
      name: json['name'],
      image: json['logo']??"https://en.wikipedia.org/wiki/Image#/media/File:Image_created_with_a_mobile_phone.png",
      cover: json['cover'],
      avgRating: convertDataToNum(json['rate']),
      bio: json['bio']??"",
      customersCount: convertDataToNum(json['customers_count']),
      productsCount: convertDataToNum(json['products_count']),
      isFollowed: convertDataToBool(json['is_followed']),
    );
  }
}
