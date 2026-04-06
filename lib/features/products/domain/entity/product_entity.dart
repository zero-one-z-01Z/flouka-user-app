import 'package:flouka/features/products/domain/entity/attribute_entity.dart';
import 'package:flouka/features/products/domain/entity/variant_entity.dart';

import '../../../reels/domain/entity/reel_entity.dart';
import 'product_review_entity.dart';

class ProductEntity {
  final int? id;
  final String? title;
  final String? description;
  final String? discountTitle;
  final num? price;
  final num? offerPrice;
  final num? discountPercentage;
  final List<AttributeEntity> attributes;
  final List<VariantEntity> variants;
  final List<ProductImage> images;
  final List<ProductImage> reviewImages;
  final String? image;
  final num? avgRating;
  final bool? isFavorite;
  final VendorEntity? vendor;
  final List<ProductEntity> related;
  final List<ProductReviewEntity> reviews;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
     this.discountTitle,
    required this.price,
    required this.vendor,
    required this.reviews,
    required this.related,
    required this.reviewImages,
    required this.offerPrice,
    required this.image,
    this.discountPercentage,
    required this.images,
    this.avgRating,
    this.isFavorite,
    required this.attributes,
    required this.variants,
  });
}
class ProductImage {
  final String image;
  final int id;
  const ProductImage({required this.image,required this.id});
}
// class VendorEntity {
//   final String avgRating;
//   final String name;
//   final String image;
//   final int id;
//   const VendorEntity({required this.image,required this.id,required this.avgRating,required this.name});
// }
