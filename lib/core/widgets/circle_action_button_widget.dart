import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'svg_widget.dart';

class CircleActionButtonWidget extends StatelessWidget {
  const CircleActionButtonWidget({super.key, this.onTap, required this.svgImage,this.color});
  final VoidCallback? onTap;
  final String svgImage;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 3.5.w,
        backgroundColor: const Color(0xffefeff3),
        child: SvgWidget(svg: svgImage, color: color??Colors.grey,width: 25,),
      ),
    );
  }
}
