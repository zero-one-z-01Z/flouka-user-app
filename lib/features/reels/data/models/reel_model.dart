import 'package:flouka/features/products/data/models/product_model.dart';
import 'package:flouka/features/reels/domain/entity/reel_entity.dart';

class ReelModel extends ReelEntity {
  ReelModel({
    required super.id,
    required super.path,
    required super.caption,
    required super.likesCount,
    required super.commentsCount,
    required super.vendor,
    required super.product,
  });

  factory ReelModel.fromJson(Map<String, dynamic> json) {
    return ReelModel(
      id: json['id'],
      path: json['path'],
      caption: json['caption'],
      likesCount: json['likes_count'],
      commentsCount: json['comments_count'],
      vendor: VendorModel.fromJson(json['vendor']),
      product: ProductModel.fromJson(json['product']),
    );
  }
}

class VendorModel extends VendorEntity {
  VendorModel({
    required super.id,
    required super.name,
    required super.image,
    required super.avgRating,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      avgRating: json['avg_rating'],
    );
  }
}
