import 'package:flouka/features/products/domain/entity/product_entity.dart';

class OrderDetailsEntity {
  final int? id;
  final num? price;
  final String? color;
  final String? size;
  final ProductEntity? productEntity;

  OrderDetailsEntity({
    required this.id,
    required this.price,
    required this.color,
    required this.size,
    required this.productEntity,
  });
}
