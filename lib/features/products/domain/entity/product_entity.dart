class ProductEntity {
  final int? id;
  final String? title;
  final String? description;
  final String? discountTitle;
  final num? price;
  final num? offerPrice;
  final num? discountPercentage;
  final String? image;
  final double? avgRating;
  final bool? isFavorite;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
     this.discountTitle,
    required this.price,
    required this.offerPrice,
    this.discountPercentage,
    this.image,
    this.avgRating,
    this.isFavorite,
  });
}
