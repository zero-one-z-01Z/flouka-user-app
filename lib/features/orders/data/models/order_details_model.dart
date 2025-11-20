import 'dart:developer';

import 'package:flouka/features/orders/domain/entity/order_details_entity.dart';
import 'package:flouka/features/products/data/models/product_model.dart';

class OrderDetailsModel extends OrderDetailsEntity {
  OrderDetailsModel({
    required super.id,
    required super.price,
    required super.color,
    required super.size,
    required super.productEntity,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    return OrderDetailsModel(
      id: json['id'],
      price: json['price'],
      color: json['color'],
      size: json['size'],
      productEntity: ProductModel.fromJson(json['product']),
    );
  }
}
