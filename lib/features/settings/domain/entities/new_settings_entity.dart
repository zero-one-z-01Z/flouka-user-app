import 'package:flutter/painting.dart';

class NewSettingsEntity {
  final String svgImage;
  final String text;
  final VoidCallback onTap;
  final Color? color;

  NewSettingsEntity({
    required this.svgImage,
    required this.text,
    required this.onTap,
    this.color,
  });
}
