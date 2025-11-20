import 'package:flouka/features/products/domain/entity/product_image_entity.dart';

class ProductImageModel extends ProductImageEntity {
  ProductImageModel({
    required super.id,
    required super.productId,
    required super.image,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) {
    return ProductImageModel(
      id: json['id'],
      productId: json['product_id'],
      image: json['image'],
    );
  }
}
