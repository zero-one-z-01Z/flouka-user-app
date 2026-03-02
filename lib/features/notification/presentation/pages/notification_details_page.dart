import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../language/presentation/provider/language_provider.dart';

class NotificationDetailsPage extends StatelessWidget {
  const NotificationDetailsPage({
    super.key,
    required this.title,
    required this.data,
  });
  final String title, data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageProvider.translate('global', 'notifications')),
        elevation: 0,
      ),
      body: Container(
        width: 100.w,
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyleClass.normalStyle(
                  color: Colors.black,
                ).copyWith(fontSize: 16.sp),
              ),
              SizedBox(height: 1.h),
              Text(
                data,
                style: TextStyleClass.normalStyle(
                  color: Colors.grey,
                ).copyWith(fontSize: 17.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
