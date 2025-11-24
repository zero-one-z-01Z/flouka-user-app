import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_lotties.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../provider/common_question_provider.dart';
import '../widgets/common_question_widget.dart';

class CommonQuestionsView extends StatelessWidget {
  const CommonQuestionsView({super.key});
  @override
  Widget build(BuildContext context) {
    CommonQuestionsProvider commonQuestionsProvider = Provider.of(context);
    commonQuestionsProvider.pagination();
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(LanguageProvider.translate("global", "common_questions")),
        ),
        // backgroundColor: Colors.red,
        body: SizedBox(
          width: 100.w,
          height: 100.h,
          child: SingleChildScrollView(
            controller: commonQuestionsProvider.controller,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(
                    builder: (context) {
                      if (commonQuestionsProvider.commonQuestionList == null) {
                        return const LoadingAnimationWidget(
                          gif: Lotties.loading,
                        );
                      } else if (commonQuestionsProvider
                          .commonQuestionList!
                          .isEmpty) {
                        return const LoadingAnimationWidget(gif: Lotties.event);
                      }
                      return Wrap(
                        children: List.generate(
                          commonQuestionsProvider.commonQuestionList!.length,
                          (index) => Builder(
                            builder: (context) {
                              return CommonQuestionWidget(
                                commonQuestionEntity: commonQuestionsProvider
                                    .commonQuestionList![index],
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
