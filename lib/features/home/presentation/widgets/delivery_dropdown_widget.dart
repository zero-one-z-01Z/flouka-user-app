import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DeliveryDropdownWidget extends StatelessWidget {
  const DeliveryDropdownWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.arrow_drop_down,color: AppColor.primaryColor,),
        SizedBox(width: 4.w,),
        Column(
          children: [
            Text('')
          ],
        )
      ],
    );
  }
}