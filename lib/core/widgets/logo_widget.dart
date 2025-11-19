import 'package:flutter/material.dart';

import '../constants/assets.gen.dart';

class LogoWidget extends StatelessWidget {
  final double? width, height;
  final BoxFit? fit;
  final bool? isWhite;
  const LogoWidget({this.height, this.width, super.key, this.fit, this.isWhite});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          Assets.images.logo.logo.path,
          fit: fit ?? BoxFit.contain,
          width: width,
          height: height,
        ),
      ],
    );
  }
}
