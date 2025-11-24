import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/config/app_color.dart';
import '../../../../../core/config/app_styles.dart';
import '../../domain/entities/common_question_entity.dart';
import '../provider/common_question_provider.dart';
import 'settings_container_widget.dart';

class CommonQuestionWidget extends StatelessWidget {
  const CommonQuestionWidget({super.key, required this.commonQuestionEntity});
  final CommonQuestionEntity commonQuestionEntity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: InkWell(
        onTap: () {
          Provider.of<CommonQuestionsProvider>(
            context,
            listen: false,
          ).goToCommonQuestionDetailsPage(
            commonQuestionEntity: commonQuestionEntity,
          );
        },
        child: SettingsContainerWidget(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    commonQuestionEntity.title,
                    style: TextStyleClass.normalStyle().copyWith(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                SizedBox(width: 3.w),
                Icon(Icons.arrow_forward_ios, color: AppColor.primaryColor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
