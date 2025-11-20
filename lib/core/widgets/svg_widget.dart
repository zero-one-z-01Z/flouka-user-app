import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgWidget extends StatelessWidget {
  final double? width, height;
  final Color? color;
  final String svg;
  final BoxFit? fit;
  const SvgWidget({
    this.height,
    this.width,
    this.color,
    required this.svg,
    super.key,
    this.fit,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              svg,
              colorFilter: color == null
                  ? null
                  : ColorFilter.mode(color!, BlendMode.srcIn),
              width: width,
              height: height,
              fit: fit ?? BoxFit.fitWidth,
            ),
          ],
        ),
      ],
    );
  }
}
