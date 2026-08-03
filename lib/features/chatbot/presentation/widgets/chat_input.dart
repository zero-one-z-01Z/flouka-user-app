import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';


import 'package:sizer/sizer.dart';

import '../../../../core/config/app_color.dart';
import '../../../language/presentation/provider/language_provider.dart';



class ChatInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInput({super.key, required this.controller, required this.onSend});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                // color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColor.primaryColor),
              ),
              child: TextField(
                controller: controller,
                minLines: 1,
                maxLines: 4,
                style: TextStyleClass.normalStyle(color: Colors.black),
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: LanguageProvider.translate('global', 'type_message'),
                  hintStyle: TextStyleClass.normalStyle(color: Colors.black),
                  border: InputBorder.none,
                  fillColor: Colors.transparent,
                ),
                onSubmitted: (_) => onSend(),
              ),
            ),
          ),
          SizedBox(width: 2.w),
          GestureDetector(
            onTap: onSend,
            child: CircleAvatar(
              radius: 6.w,
              backgroundColor: AppColor.primaryColor,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(3.1416),
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..scale(LanguageProvider.isAr()?1.0: -1.0, 1.0),
                  child: SvgWidget(svg: AppImages.send,color: Colors.white,),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
