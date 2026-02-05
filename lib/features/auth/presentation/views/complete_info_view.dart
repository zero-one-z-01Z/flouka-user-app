import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/core/widgets/list_text_field_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../providers/complete_info_provider.dart';
import '../widgets/profile_image_widget.dart';

class CompleteInfoView extends StatelessWidget {
  const CompleteInfoView({super.key, required this.isEdit});

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    final completeInfoProvider = Provider.of<CompleteInfoProvider>(context);
    completeInfoProvider.isEdit = isEdit;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          LanguageProvider.translate("auth", "Profile"),
          style: TextStyleClass.headStyle().copyWith(fontSize: 17.sp),
        ),
      ),
      body: Form(
        key: completeInfoProvider.formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              SizedBox(height: 4.h),
              const ProfileImageWidget(),
              SizedBox(height: 2.h),
              ListTextFieldWidget(
                inputs: completeInfoProvider.completeInfoTextFieldList,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
        child: ButtonWidget(
          height: 6.h,
          width: 80.w,
          onTap: () {
            completeInfoProvider.updateProfileButton();
          },
          text: isEdit ? "save" : "sign_up",
        ),
      ),
    );
  }
}
