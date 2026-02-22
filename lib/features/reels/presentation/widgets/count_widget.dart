import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';

class CountWidget extends StatelessWidget {
  const CountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        3,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 1.w),
          padding: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.5.h),
          // decoration: smallDecoration,
          child: Text("د", style: TextStyleClass.normalStyle()),
        ),
      ),
    );
  }
}
