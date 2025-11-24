import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/common_question_entity.dart';
import '../widgets/common_question_details_widget.dart';

class CommonQuestionDetailsview extends StatelessWidget {
  const CommonQuestionDetailsview({super.key, required this.commonQuestionEntity});
  final CommonQuestionEntity commonQuestionEntity;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LanguageProvider.translate("global", "common_questions")),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: 100.w,
                height: 100.h,
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: ListView.builder(
                  itemCount: commonQuestionEntity.faq.length,
                  itemBuilder: (ctx, i) {
                    return CommonQuestionDetailsWidget(
                      faqEntity: commonQuestionEntity.faq[i],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
