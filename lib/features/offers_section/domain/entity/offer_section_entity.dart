import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';

class OfferSectionEntity {
  final int id;
  final String title;
  final String description;
  final Color color;
  final List<ProductEntity> products;

  OfferSectionEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.color,
    required this.products,
  });
}
