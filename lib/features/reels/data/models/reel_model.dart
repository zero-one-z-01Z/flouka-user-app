import 'package:flouka/core/helper_function/convert.dart';
import 'package:flouka/features/products/data/models/product_model.dart';
import 'package:flouka/features/reels/domain/entity/reel_entity.dart';

class ReelModel extends ReelEntity {
  ReelModel({
    required super.id,
    required super.productId,
    required super.vendorId,
    required super.video,
    required super.title,
    required super.vendorName,
    required super.vendorLogo,
  });

  factory ReelModel.fromJson(Map<String, dynamic> json) {
    return ReelModel(
      id: json['id'],
      productId: json['product_id'],
      vendorId: json['vendor_id'],
      video: json['video'],
      title: json['title'],
      vendorName: json['vendor_name'],
      vendorLogo: json['vendor_logo'],
    );
  }
}

class VendorModel extends VendorEntity {
  VendorModel({
    required super.id,
    required super.name,
    required super.isFavorite,
    required super.bio,
    required super.isFollow,
    required super.logo,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    return VendorModel(
      id: json['id'],
      name: json['name'],
      isFavorite: convertDataToBool(json['is_favorite']),
      bio: json['bio'],
      isFollow: convertDataToBool(json['is_follow']),
      logo: json['logo'],
    );
  }
}
