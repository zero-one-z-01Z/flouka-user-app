
import '../../../../core/helper_function/convert.dart';
import '../../../reels/data/models/reel_model.dart';
import '../../domain/entity/store_entity.dart';

class StoreModel extends StoreEntity {
  StoreModel({required super.id, required super.name,required super.vendor,
    required super.lat,required super.lng,required super.address,
    required super.createdAt, required super.distance,
    required super.logo,
    required super.productsCount, required super.customersCount,
    required super.rate});

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(id: json['id'], name: json['name'],
        address: json['address'],
        createdAt: DateTime.parse(json['created_at']),
        customersCount: convertDataToNum(json['customers_count'])??0,
        distance: convertDataToDouble(json['distance']),
        lat: convertDataToDouble(json['lat']),
        logo: json['cover']??"",
        lng: convertDataToDouble(json['lng']),
        vendor: VendorModel.fromJson(json['vendor']),
        productsCount: convertDataToNum(json['products_count'])??0,
        rate:convertDataToNum(json['rate'])??0);
  }
}
