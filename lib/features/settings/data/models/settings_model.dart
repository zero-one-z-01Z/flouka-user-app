import 'dart:io';

import '../../../../../core/helper_function/convert.dart';
import '../../domain/entities/settings_entity.dart';

class SettingsModel extends SettingsEntity {
  SettingsModel({
    required super.version,
    required super.mustUpdate,
    required super.phone,
    required super.termsLink,
    required super.aboutLink,
    required super.privacyLink,
    required super.id,
    required super.email,
    required super.maxPrice,
    required super.whatsapp,
    required super.joinPrice,
    required super.joinTax,
    required super.auctionPercentage,
    required super.bestPriceGift,
    required super.packageName,
    required super.appId,
    required super.tax,
    required super.delivery,
  });

  factory SettingsModel.fromJson(Map data) {
    return SettingsModel(
      id: convertStringToInt(data["id"]),
      version: convertStringToInt(
        data[Platform.isIOS ? 'user_ios_version' : 'user_version'],
      ),
      mustUpdate: convertDataToBool(
        data[Platform.isIOS ? "must_update_user_ios" : 'must_update_user'],
      ),
      phone: data["phone"] ?? "",
      email: data["email"] ?? "",
      whatsapp: data["whatsapp"] ?? "",
      termsLink: data['terms_link'],
      aboutLink: data["about_link"],
      privacyLink: data["privacy_link"],
      joinPrice: convertDataToNum(data["join_price"] ?? 1),
      joinTax: convertDataToNum(data["join_tax"] ?? 0),
      auctionPercentage: convertDataToNum(data["auction_percentage"] ?? 0),
      bestPriceGift: convertDataToNum(data["best_price_gift"] ?? 0),
      packageName: data["package_name"] ?? "",
      appId: data["app_id"] ?? "",
      tax: convertDataToNum(data["tax"] ?? 0)!,
      delivery: convertDataToNum(data["delivery_price"] ?? 0)!,
      maxPrice: convertDataToNum(data["max_price"] ?? 20000),
    );
  }
}
