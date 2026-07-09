import '../../../products/domain/entity/product_entity.dart';

class CartEntity {
  int? id;
  int? quantity;
  num? stock;
  ProductEntity? product;
  CartVariantEntity? variant;
  num? unitPrice;
  int storeId;

  num get subTotal => (quantity??0) * (unitPrice??0);

  CartEntity({this.id, this.quantity, this.product,this.variant,this.unitPrice,required this.storeId, this.stock});
}

class CartVariantEntity {
  int? id;
  int? productId;
  String? name;
  String? sku;
  num? price;
  num? offerPrice;
  num? finalPrice;
  String? createdAt;
  String? updatedAt;

  List<CartVariantAttributeEntity> attributeValues;

  CartVariantEntity({
    this.id,
    this.productId,
    this.name,
    this.sku,
    this.price,
    this.offerPrice,
    this.finalPrice,
    this.createdAt,
    this.updatedAt,
    this.attributeValues = const [],
  });
}

class CartVariantAttributeEntity {
  String? attributeName;
  String? valueName;
  String? valueCode;

  CartVariantAttributeEntity({
    this.attributeName,
    this.valueName,
    this.valueCode,
  });
}