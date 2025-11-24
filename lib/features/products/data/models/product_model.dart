import 'package:flouka/core/helper_function/convert.dart';
import 'package:flouka/features/products/data/models/product_image_model.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    super.id,
    super.name,
    super.description,
    super.price,
    super.offerPrice,
    super.active,
    super.marketId,
    super.image,
    super.images,
    super.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<ProductImageModel> images = [];
    if (json.containsKey('images') && json['images'] != null) {
      for (var i in json['images']) {
        images.add(ProductImageModel.fromJson(i));
      }
    }

    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      offerPrice: json['offerPrice'],
      active: convertDataToBool(json['active']),
      marketId: json['marketId'],
      image: json['image'],
      images: images,
      rating: json['rating'] != null
          ? (json['rating'] as num).toDouble()
          : null,
    );
  }
}
