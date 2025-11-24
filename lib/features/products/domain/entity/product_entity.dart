import 'package:flouka/features/products/domain/entity/product_image_entity.dart';

class ProductEntity {
  final int? id;
  final String? name;
  final String? description;
  final num? price;
  final num? offerPrice;
  final bool? active;
  final int? marketId;
  final String? image;
  final List<ProductImageEntity?>? images;
  final double? rating;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.offerPrice,
    required this.active,
    required this.marketId,
    required this.image,
    required this.images,
    this.rating,
  });
}
