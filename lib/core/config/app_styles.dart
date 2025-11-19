import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

abstract class AppStyles {
  static TextStyle style22Normal = TextStyle(fontSize: 22.sp, height: 1.3);
  static TextStyle style20Normal = TextStyle(fontSize: 20.sp, height: 1.3);
  static TextStyle style19Normal = TextStyle(fontSize: 19.sp, height: 1.3);
  static TextStyle style18Normal = TextStyle(fontSize: 18.sp, height: 1.3);
  static TextStyle style17Normal = TextStyle(fontSize: 17.sp, height: 1.3);
  static TextStyle style16Normal = TextStyle(fontSize: 16.sp);
  static TextStyle style15Normal = TextStyle(fontSize: 15.sp, height: 1.3);
  static TextStyle style13Normal = TextStyle(fontSize: 13.sp, height: 1.3);
  static TextStyle style10Normal = TextStyle(
    color: Colors.black,
    fontSize: 10.sp,
    height: 1.3,
    fontWeight: FontWeight.w400,
  );

  static TextStyle normalLineThroughStyle({
    double? fontSize,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) {
    return TextStyle(
      color: color ?? Colors.black,
      decoration: decoration ?? TextDecoration.lineThrough,
      decorationColor: decorationColor ?? Colors.red,
      fontSize: fontSize ?? 10.sp,
      height: 1.3,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle normalBoldStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: fontSize ?? 11.sp,
      height: 1.3,
      fontWeight: fontWeight ?? FontWeight.bold,
    );
  }

  static TextStyle textButtonStyle({Color? color}) {
    return TextStyle(color: color ?? Colors.white, fontSize: 14.sp, height: 1.3);
  }

  static TextStyle smallTextButtonStyle({Color? color}) {
    return TextStyle(
      color: color ?? Colors.white,
      fontSize: 9.sp,
      height: 1.3,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle smallStyle({double? fontSize, Color? color}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: fontSize ?? 9.sp,
      height: 1.3,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle smallBoldStyle({Color? color}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: 9.sp,
      height: 1.3,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle tinyStyle({Color? color}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: 7.5.sp,
      height: 1.3,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle tinyBoldStyle({Color? color}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: 7.5.sp,
      height: 1.3,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle veryTinyStyle({Color? color}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: 5.5.sp,
      height: 1.3,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle smallDecorationStyle({Color? color}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: 9.sp,
      height: 1.3,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline,
      decorationColor: color ?? Colors.black,
    );
  }
}
