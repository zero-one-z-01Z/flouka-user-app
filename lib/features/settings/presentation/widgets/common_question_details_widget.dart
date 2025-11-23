import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/config/app_color.dart';
import '../../../../../core/config/app_styles.dart';
import '../../../../../core/widgets/animation/fade_transition_widget.dart';
import '../../domain/entities/common_question_entity.dart';
import 'settings_container_widget.dart';

class CommonQuestionDetailsWidget extends StatefulWidget {
  const CommonQuestionDetailsWidget({super.key, required this.faqEntity});
  final FaqEntity faqEntity;

  @override
  State<CommonQuestionDetailsWidget> createState() =>
      _CommonQuestionDetailsWidgetState();
}

class _CommonQuestionDetailsWidgetState
    extends State<CommonQuestionDetailsWidget> {
  bool open = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                open = !open;
              });
            },
            child: SettingsContainerWidget(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.faqEntity.question,
                        style: TextStyleClass.normalStyle().copyWith(
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    FadeTransitionWidget(
                      child: open
                          ? Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: AppColor.primaryColor,
                            )
                          : Icon(
                              Icons.arrow_forward_ios,
                              color: AppColor.primaryColor,
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (open) ...[
            SizedBox(height: 1.h),
            Text(widget.faqEntity.answer, style: TextStyleClass.normalStyle()),
          ],
        ],
      ),
    );
  }
}
