import '../../../reels/domain/entity/reel_entity.dart';

class StoreEntity {
  final int id;
  final String name;
  final double lat;
  final double lng;
  final num rate;
  final String logo;
  final String address;
  final DateTime createdAt;
  final double distance;
  final num? productsCount;
  final num? customersCount;
  final VendorEntity vendor;
  StoreEntity({required this.id, required this.name,required this.vendor,
    required this.lat,required this.lng,required this.address,
    required this.createdAt, required this.distance,
    required this.logo,
    required this.productsCount, required this.customersCount,
    required this.rate});
}
