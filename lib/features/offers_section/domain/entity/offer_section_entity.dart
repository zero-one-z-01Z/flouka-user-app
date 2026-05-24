import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class OfferSectionEntity {
  final int id;
  final Color color;
  final String title;
  final Color ?titleColor;
  final String description;
  final Color ?descriptionColor;
  final String buttonText;
  final Color ?buttonColor;
  final Color ?buttonTextColor;
  final DateTime startDate;
  final DateTime endDate;
  final List<ProductEntity> products;

  OfferSectionEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.buttonColor,
    required this.color,
    required this.buttonTextColor,
    required this.products,
    required this.buttonText,
    required this.startDate,
    required this.endDate,
    required this.descriptionColor,
    required this.titleColor,
  });
}
