import 'package:flutter/cupertino.dart';

class CategoryEntity {
  final int id;
  final int? parentId;
  final String name;
  final String? image;
  final String? icon;
  VoidCallback? onTap;
  final List<CategoryEntity>? children;

  CategoryEntity({
    required this.id,
    required this.image,
    required this.icon,
    required this.name,
    required this.parentId,
    this.onTap,
    this.children,
  });
}
