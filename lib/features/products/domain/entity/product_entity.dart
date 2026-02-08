class ProductEntity {
  final int? id;
  final String? title;
  final String? description;
  final num? price;
  final num? offerPrice;
  final String? image;
  final double? avgRating;
  final bool? isFavorite;

  ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.offerPrice,
    required this.image,
    this.avgRating,
    this.isFavorite,
  });
}

