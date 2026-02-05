import 'package:flutter/painting.dart';

class ProfileSettingsEntity {
  final String svgImage;
  final String text;
  final VoidCallback onTap;
  final Color? color;

  ProfileSettingsEntity({
    required this.svgImage,
    required this.text,
    required this.onTap,
    this.color,
  });
}
