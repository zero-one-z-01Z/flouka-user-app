import 'package:flouka/core/constants/assets.dart';
import 'package:flutter/material.dart';


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
          Images.floukaLogo,
          fit: fit ?? BoxFit.contain,
          width: width,
          height: height,
        ),
      ],
    );
  }
}
