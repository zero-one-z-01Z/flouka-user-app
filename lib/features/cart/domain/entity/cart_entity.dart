import '../../../products/domain/entity/product_entity.dart';

class CartEntity {
  int? id;
  int? quantity;
  ProductEntity? product;

  num get subTotal => quantity! * product!.price!;

  CartEntity({this.id, this.quantity, this.product});
}
