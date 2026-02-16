
import 'dart:developer';

import 'package:flouka/core/helper_function/convert.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    super.id,
    super.title,
    super.description,
    super.price,
    super.offerPrice,
    super.image,
    super.avgRating,
    super.isFavorite,
    required super.discountTitle,
    required super.discountPercentage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    try {
      return ProductModel(
        id: json['id'],
        title: json['title'] ?? "",
        description: json['description'] ?? "",
        price: convertDataToNum(json['price']) ?? 0,
        offerPrice: convertDataToNum(json['offer_price']) ?? 0,
        image: json['image'] ?? "",
        avgRating: json['rating'] != null
            ? (json['rating'] as num).toDouble()
            : null,
        isFavorite: json['is_favorite'] ?? false,
        discountTitle: json['discount_title'] ?? "",
        discountPercentage: convertDataToNum(json['discount_percentage']) ?? 0,
      );
    } catch (e, l) {
      log(l.toString());
      log(e.toString());
      throw e;
    }
  }
}

// {
//     "id": 7,
//     "title": "test title ar",
//     "price": "300.00",
//     "offer_price": "340.00",
//     "avg_rating": "0.00",
//     "image": "http://floka_laravel.test/images/place_holder/default.png",
//     "is_favorite": false
// },
