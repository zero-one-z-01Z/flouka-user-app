import 'package:flutter/painting.dart';

class NewSettingsEntity {
  final String svgImage;
  final String text;
  final VoidCallback onTap;

  NewSettingsEntity({
    required this.svgImage,
    required this.text,
    required this.onTap,
  });
}
