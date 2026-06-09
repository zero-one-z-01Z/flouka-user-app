import 'package:flouka/features/products/domain/entity/product_entity.dart';

class VariantEntity{
  int id;
  num price;
  num? offerPrice;
  String sku;
  StockEntity? stock;
  List<int> combination;
  List<ProductImage> images;
  VariantEntity({required this.id,required this.price,required this.offerPrice,required this.sku,
    required this.images,
    required this.combination, required this.stock});

}class StockEntity{
  int id;
  int storeProductId;
  int? productVariantId;
  int quantity;
  StockEntity({required this.id,required this.storeProductId,required this.productVariantId,required this.quantity});

}