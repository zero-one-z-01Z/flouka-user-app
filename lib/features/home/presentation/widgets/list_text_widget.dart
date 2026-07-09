import 'package:flouka/core/config/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:marquee/marquee.dart';

class ListTextWidget extends StatelessWidget {
  const ListTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listText = ['سسسسسسسسسسسسسسسسسسسسسس', 'شششششششششششششششششششششششششش', 'قققققققققققققققققققققققققققق'];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      margin: EdgeInsets.symmetric(vertical: 2.h),
      decoration:const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffD29AD8), Color(0xffB65AF6),],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 1],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: SingleChildScrollView(
              physics:const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(spacing: 2.w,
                children: List.generate(25, (index) {
                  return Container(
                    width: 15,height: 15,
                    decoration:const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  );
                },),
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          SizedBox(
            height: 3.h,
            child: Marquee(
              text: listText.join(' | '),
              style:TextStyleClass.normalStyle(color: Colors.white),
              scrollAxis: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.start,
              blankSpace: 20.0,
              velocity: 100.0,
              pauseAfterRound: const Duration(seconds: 1),
              startPadding: 10.0,
              accelerationDuration:const Duration(seconds: 1),
              accelerationCurve: Curves.linear,
              decelerationDuration:const Duration(milliseconds: 500),
              decelerationCurve: Curves.easeOut,
            ),
          ),
        ],
      ),
    );
  }
}
