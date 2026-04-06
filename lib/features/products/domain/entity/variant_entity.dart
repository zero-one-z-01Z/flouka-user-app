class VariantEntity{
  int id;
  num price;
  num? offerPrice;
  String sku;
  int stock;
  List<int> combination;

  VariantEntity({required this.id,required this.price,required this.offerPrice,required this.sku,
    required this.combination, required this.stock});

}