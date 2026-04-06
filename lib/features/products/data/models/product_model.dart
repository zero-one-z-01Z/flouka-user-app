
import 'dart:developer';

import 'package:flouka/core/helper_function/convert.dart';
import 'package:flouka/features/products/data/models/product_review_model.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';

import '../../../reels/data/models/reel_model.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    super.id,
    super.title,
    super.description,
    required super.image,
    super.price,
    super.offerPrice,
    required super.images,
    super.avgRating,
    required super.reviews,
    super.isFavorite,
    required super.vendor,
    required super.related,
    required super.reviewImages,
    required super.discountTitle,
    required super.discountPercentage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<ProductImageModel> images=[];
    List<ProductImageModel> reviewsImages=[];
    List<ProductReviewModel> reviews=[];

    if(json['images'] !=null){
      for(var element in json['images']){
        images.add(ProductImageModel.fromJson(element));
      }
    }
    if(json['review_images'] !=null){
      for(var element in json['review_images']){
        reviewsImages.add(ProductImageModel.fromJson(element));
      }
    }

    if(json['reviews'] !=null){
      for(var element in json['reviews']){
        reviews.add(ProductReviewModel.fromJson(element));
      }
    }

    try {
      return ProductModel(
        id: json['id'],
        title: json['title'] ?? "",
        description: json['description'] ?? "",
        image: json['image'] ,
        price: convertDataToNum(json['price']),
        offerPrice: convertDataToNum(json['offer_price']),
        reviewImages: reviewsImages,
        reviews: reviews,

        images: images,
        avgRating: json['avg_rating'] != null
            ? convertDataToNum(json['avg_rating'])
            : null,
        isFavorite: json['is_favorite'] ?? false,
        discountTitle: json['discount_title'] ?? "",
        discountPercentage: convertDataToNum(json['discount_percentage']) ?? 0,
        vendor:json['vendor'] !=null ? VendorModel.fromJson(json['vendor']) : null,
        related: [],
      );
    } catch (e, l) {
      log(l.toString());
      log(e.toString());
      throw e;
    }
  }
}

class ProductImageModel extends ProductImage {
  const ProductImageModel({
    required super.image,
    required super.id
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    try {
      return ProductImageModel(image: json['image'],id: json['id'],);
    } catch (e, l) {
      log(l.toString());
      log(e.toString());
      throw e;
    }
  }
}

// class VendorModel extends VendorEntity {
//   const VendorModel({
//     required super.image,required super.name,
//     required super.id,required super.avgRating,
//   });
//
//   factory VendorModel.fromJson(Map<String, dynamic> json) {
//     try {
//       return VendorModel(image: json['image'],id: json['id'],
//       name: json['name'],avgRating: json['avg_rating']);
//     } catch (e, l) {
//       log(l.toString());
//       log(e.toString());
//       throw e;
//     }
//   }
// }
