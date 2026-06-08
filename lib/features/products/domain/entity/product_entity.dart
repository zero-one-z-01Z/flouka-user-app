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
  final num? rate;
  bool isFavorite;
  final StoreEntity? store;
  final List<RelatedEntity> related;
  final List<ProductEntity> recommended;
  final List<ProductReviewEntity> reviews;
  final StockEntity? stock;

  ProductEntity({
    required this.id,
    required this.title,
    required this.recommended,
    required this.description,
     this.discountTitle,
    required this.price,
    required this.store,
    required this.reviews,
    required this.related,
    required this.reviewImages,
    required this.offerPrice,
    required this.image,
    required this.discountPercentage,
    required this.images,
    required this.rate,
    required this.isFavorite,
    required this.stock,
    required this.attributes,
    required this.variants,
  });
}
class ProductImage {
  final String image;
  final int id;
  const ProductImage({required this.image,required this.id});
}
class StoreEntity {
  final int id;
  final String name;
  final int vendorId;
  final String logo;
  final double lat;
  final double lng;
  final double rate;
  final String address;
  final int productsCount;
  final int customersCount;
  final double distance;
  final VendorEntity? vendor;

  const StoreEntity({required this.id,required this.name,
    required this.logo,
    required this.vendor,
    required this.vendorId,required this.lat,required this.lng,required this.rate,required this.address,
    required this.productsCount,required this.customersCount,required this.distance});
}



class RelatedEntity {
  final int id;
  final String title;
  final String image;
  final String description;
  final num finalPrice;

  const RelatedEntity({required this.id,required this.title, required this.image,required this.description, required this.finalPrice});
}

