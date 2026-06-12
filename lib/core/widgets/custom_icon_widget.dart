import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'svg_widget.dart';

class CustomIconWidget extends StatelessWidget {
  const CustomIconWidget({super.key, required this.svg,this.color});
  final String svg;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: SvgWidget(
        svg: svg,
        color: color??const Color(0xff686868),
        width: 5.w,
        height: 5.w,
      ),
    );
  }
}
