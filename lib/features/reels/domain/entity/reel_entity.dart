import 'package:flouka/features/products/domain/entity/product_entity.dart';

class ReelEntity {
  final int id;
  final String path;
  final String caption;
  final int likesCount;
  final int commentsCount;
  final VendorEntity vendor;
  final ProductEntity product;
  ReelEntity({
    required this.id,
    required this.path,
    required this.caption,
    required this.likesCount,
    required this.commentsCount,
    required this.vendor,
    required this.product,
  });
}

class VendorEntity {
  final int id;
  final String name;
  final String image;
  final String avgRating;
  VendorEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.avgRating,
  });
}
