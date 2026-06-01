import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../reviews/presentation/providres/create_rate_provider.dart';

class ShareYourExperienceWidget extends StatelessWidget {
  const ShareYourExperienceWidget({super.key, required this.StoreId, required this.orderId});
  final int orderId;
  final int StoreId;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          LanguageProvider.translate("global", "Share Your Experience"),
          style: TextStyleClass.normalStyle().copyWith(fontSize: 15.sp),
        ),
        SizedBox(height: 1.h),
        ButtonWidget(
          borderRadius: 10,
          color: const Color(0xffdff7ff),
          onTap: () {
            Provider.of<CreateRateProvider>(context,listen: false).gotoReviewPage(itemId: StoreId, orderId: orderId, product: false);
          },
          text: LanguageProvider.translate("buttons", "Seller"),
          textStyle: TextStyleClass.smallStyle(),
          height: 4.h,
        ),
      ],
    );
  }
}
