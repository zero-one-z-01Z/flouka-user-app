import 'package:flutter/material.dart';

class SocialAuthEntity {
  final String image;
  final String text;
  final VoidCallback onTap;

  SocialAuthEntity({required this.image, required this.text, required this.onTap});
}