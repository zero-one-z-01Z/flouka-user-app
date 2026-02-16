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
      products: products,
    );
  }
}
