import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/core/widgets/text_field_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../widgets/add_address_location_widget.dart';
import '../widgets/address_label_list_widget.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageProvider.translate("global", "ADD NEW ADDRESS")),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            const AddAddressLocationWidget(),
            SizedBox(height: 3.h),
            const Divider(color: Color(0xffe3e3e3), thickness: 1.2),
            SizedBox(height: 1.h),
            Text(
              LanguageProvider.translate("global", "Additional Address Details"),
              style: TextStyleClass.smallStyle(),
            ),
            TextFieldWidget(
              borderRadius: 12,
              controller: TextEditingController(),
              borderWidth: 1.2,
              borderColor: const Color(0xffdbdbdb),
              color: const Color(0xfff0f0f0),
            ),
            const Divider(color: Color(0xffe3e3e3), thickness: 1.2),
            SizedBox(height: 1.h),
            Text(
              LanguageProvider.translate("global", "Personal information"),
              style: TextStyleClass.smallStyle(),
            ),
            SizedBox(height: 4.h),
            Text(
              LanguageProvider.translate("global", "Mobile Number"),
              style: TextStyleClass.smallStyle(),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFieldWidget(
                    borderRadius: 12,
                    prefix: Padding(
                      padding: EdgeInsets.only(top: 1.8.h, left: 4.w),
                      child: Text(
                        "+20",
                        style: TextStyleClass.smallStyle().copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    controller: TextEditingController(),
                    borderWidth: 1.2,
                    borderColor: const Color(0xffdbdbdb),
                    color: const Color(0xfff0f0f0),
                  ),
                ),
                SizedBox(width: 2.w),
                Container(
                  alignment: Alignment.center,
                  width: 10.w,
                  height: 5.5.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffdbdbdb), width: 1.2),
                    color: const Color(0xfff0f0f0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "OTP",
                    style: TextStyleClass.smallStyle().copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Text(
              LanguageProvider.translate("global", "Address Lable (Optional)"),
              style: TextStyleClass.normalStyle().copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              ),
            ),
            SizedBox(height: 2.h),
            const AddressLabelListWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        child: ButtonWidget(
          onTap: () {},
          text: "Save address",
          textStyle: TextStyleClass.normalStyle().copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
