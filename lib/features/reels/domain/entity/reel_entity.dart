
class ReelEntity {
  final int id;
  final int vendorId;
  final int? productId;
  final String video;
  final String? title;
  final String vendorName;
  final String vendorLogo;
  ReelEntity({
    required this.id,
    required this.video,
    required this.title,
    required this.vendorName,
    required this.vendorLogo,
    required this.vendorId,
    required this.productId,
  });
}

class VendorEntity {
  final int id;
  final String name;
  final String logo;
  final String? cover;
  final String bio;
  final bool isFavorite;
  final bool isFollow;
  VendorEntity({
    required this.id,
    required this.name,
    required this.cover,
    required this.isFavorite,
    required this.bio,
    required this.isFollow,
    required this.logo,
  });
}
