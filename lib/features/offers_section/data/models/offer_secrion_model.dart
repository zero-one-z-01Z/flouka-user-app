import 'package:flouka/features/offers_section/domain/entity/offer_section_entity.dart';

import '../../../../core/helper_function/convert.dart';
import '../../../products/data/models/product_model.dart';

class OfferSectionModel extends OfferSectionEntity {
  OfferSectionModel({
    required super.id,
    required super.title,
    required super.description,
    required super.color,
    required super.products,
    required super.buttonColor,
    required super.buttonTextColor,
    required super.buttonText,
    required super.startDate,
    required super.endDate,
    required super.titleColor,
    required super.descriptionColor,
  });

  factory OfferSectionModel.fromJson(Map<String, dynamic> json) {
    List<ProductModel> products = [];
    for (var product in json['products']) {
      products.add(ProductModel.fromJson(product));
    }
    return OfferSectionModel(
      id: json['id'],
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      color: convertHexToColor(json['bg_color']) ,
      buttonColor: convertHexToColor(json['button_color']) ,
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      descriptionColor: json['description_color'] != null ? convertHexToColor(json['description_color']) : null,
      buttonTextColor: json['button_text_color'] != null ? convertHexToColor(json['button_text_color']) : null,
      buttonText: json['button_text'] ?? "",
      titleColor: json['title_color'] != null ? convertHexToColor(json['title_color']) : null,
      products: products,
    );
  }
}
