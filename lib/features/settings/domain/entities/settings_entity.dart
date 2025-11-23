class SettingsEntity {
  int id;
  String? whatsapp, phone, email;
  String termsLink;
  String aboutLink;
  String privacyLink;
  num? joinPrice;
  num? joinTax;
  num? auctionPercentage;
  num? bestPriceGift;
  bool mustUpdate;
  num? maxPrice;
  int version;
  final num tax;
  final num delivery;
  String? packageName, appId;
  SettingsEntity({
    required this.id,
    required this.tax,
    required this.delivery,
    required this.termsLink,
    required this.aboutLink,
    required this.email,
    required this.maxPrice,
    required this.phone,
    required this.whatsapp,
    required this.version,
    required this.joinPrice,
    required this.joinTax,
    required this.auctionPercentage,
    required this.bestPriceGift,
    required this.privacyLink,
    required this.mustUpdate,
    required this.packageName,
    required this.appId,
  });

  num joinFees() {
    return (joinPrice ?? 0) * ((joinTax ?? 0) / 100);
  }

  num total() {
    return (joinPrice ?? 0) + joinFees();
  }
}
