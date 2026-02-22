import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ContentIconAction extends StatelessWidget {
  final void Function()? onTap;
  final EdgeInsets margin;
  final Widget icon;
  final Widget title;
  const ContentIconAction(
      {super.key,
      required this.onTap,
      required this.margin,
      required this.icon,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            height: 13.w,
            width: 13.w,
            margin: margin,
            child: Column(children: [icon, SizedBox(height: 1.h), title])));
  }
}
