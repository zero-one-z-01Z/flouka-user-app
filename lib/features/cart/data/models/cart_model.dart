import 'package:flouka/features/products/data/models/product_model.dart';
import '../../domain/entity/cart_entity.dart';

class CartModel extends CartEntity {
  CartModel({
    super.id,
    super.quantity,
    super.product,
    super.colorId,
    super.sizeId,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      quantity: json['quantity'],
      product: ProductModel.fromJson(json['product']),
      colorId: json['color_id'],
      sizeId: json['size_id'],
    );
  }
}
