import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/core/widgets/text_field_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/add_address_location_widget.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageProvider.translate("global", "ADD NEW ADDRESS")),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4.h),
            const AddAddressLocationWidget(),
            SizedBox(height: 4.h),
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
            SizedBox(height: 3.h),
            Text(LanguageProvider.translate("global", "Address Lable (Optional)")),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        child: ButtonWidget(onTap: () {}, text: "Save address"),
      ),
    );
  }
}
