class StoreDetailsEntity {
  final int id;
  final String name;
  final String? image;
  final String? cover;
  final num? avgRating;
  final num? customersCount;
  final num? productsCount;
  final bool isFollowed;
  StoreDetailsEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.cover,
    required this.avgRating,
    required this.customersCount,
    required this.productsCount,
    required this.isFollowed,
  });
}
