import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../providers/on_boarding_provider.dart';
import '../widgets/custom_dots_indicator.dart';
import '../widgets/on_boarding_item_widget.dart';
import '../widgets/skip_with_logo_widget.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final onBoardingProvider = Provider.of<OnBoardingProvider>(context);
    return Scaffold(
      backgroundColor: onBoardingProvider.selected.color,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        width: 100.w,
        height: 100.h,
        color: onBoardingProvider.selected.color,
        padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 3.h),
        child: Column(
          children: [
            SizedBox(height: 6.h,),
            Row(
              children: [
                Text(LanguageProvider.translate('global', 'app_name'),
                  style: TextStyleClass.normalStyle(color: onBoardingProvider.index==2?
                  Color(0xffD7FC70):Color(0xff35035C)),),
                Spacer(),
                ButtonWidget(onTap: (){
                  onBoardingProvider.skipButtonPressed();
                },borderRadius: 8,height: 3.5.h, text: 'skip',takeSmallestWidth: true,color: Colors.transparent,
                borderColor: onBoardingProvider.index==2?Colors.white:Color(0xff35035C).withAlpha(150),textStyle: TextStyleClass.smallStyle(color: onBoardingProvider.index==2?Colors.white:Color(0xff35035C).withAlpha(150)),),
              ],
            ),
            SizedBox(height: 4.h,),
            Image.asset(onBoardingProvider.selected.image.replaceAll('*lang*', LanguageProvider.languageCode()??"fr"),
            fit: BoxFit.contain,width: 80.w,height: 40.h,),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(LanguageProvider.translate('on_boarding', onBoardingProvider.selected.title1),style: TextStyleClass.headStyle(color: onBoardingProvider.index==0?Color(0xff35035C):Colors.white),),
                  Text(LanguageProvider.translate('on_boarding',onBoardingProvider.selected.title2),style: TextStyleClass.headStyle(color: onBoardingProvider.selected.textColor,),),
                  SizedBox(height: 1.h,),
                  Text(LanguageProvider.translate('on_boarding',onBoardingProvider.selected.description),style: TextStyleClass.normalStyle(color: onBoardingProvider.selected.descColor,),),

                  Row(
                    spacing: 3.w,
                    children: [
                      ...List.generate(3, (index){
                        return Expanded(
                          child: InkWell(
                            onTap: (){
                              onBoardingProvider.onNextButtonPressed(index);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Container(
                                height: 3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: index==onBoardingProvider.index?onBoardingProvider.selected.stepColor:Colors.white.withAlpha(80)
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                  SizedBox(height: 4.h,),
                  ButtonWidget(onTap: (){
                    onBoardingProvider.onNextButtonPressed();
                  }, text: 'next',color: onBoardingProvider.selected.btnColor,
                  textStyle: TextStyleClass.normalStyle(color: onBoardingProvider.selected.btnTextColor),),
                  SizedBox(height: 3.h,),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
