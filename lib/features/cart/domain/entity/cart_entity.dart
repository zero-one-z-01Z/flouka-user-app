import '../../../products/domain/entity/product_entity.dart';

class CartEntity {
  int? id;
  int? quantity;
  ProductEntity? product;
  int? colorId;
  int? sizeId;

  num get subTotal => quantity! * product!.price!;

  CartEntity({
    this.id,
    this.quantity,
    this.product,
    this.colorId,
    this.sizeId,
  });
}
