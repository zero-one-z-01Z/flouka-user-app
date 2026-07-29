import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/products/presentation/providers/products_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/language/presentation/provider/language_provider.dart';
import '../config/app_styles.dart';
import '../constants/constants.dart';
import '../widgets/text_field_widget.dart';
import 'guest_dialog.dart';

void reportDialog({required String title, required String type, required int id}) {
  if (!AuthProvider.isLogin())
  {
    showGuestDialog();
    return;
  }
  TextEditingController controller = TextEditingController();

  showDialog(
    context: Constants.globalContext(),
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
        content: SizedBox(
          width: 85.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Constants.isTablet
                    ? TextStyleClass.normalStyle(fontSize: 2.5.sp, color: Colors.black)
                    : TextStyleClass.smallStyle(color: Colors.black),
              ),
              SizedBox(height: 1.h),
              TextFieldWidget(
                controller: controller,
                maxLines: 2,
                contentPadding: Constants.isTablet
                    ? EdgeInsets.symmetric(vertical: 1.h, horizontal: 0.5.w)
                    : null,
                style: Constants.isTablet
                    ? TextStyleClass.normalStyle(fontSize: 2.5.sp, color: Colors.black)
                    : TextStyleClass.smallStyle(color: Colors.black),
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        ProductDetailsProvider provider = context.read();
                        provider.createReport(
                          id: id,
                          type: type,
                          comment: controller.text,
                        );
                      },
                      child: Text(
                        LanguageProvider.translate("buttons", "send"),
                        style: Constants.isTablet
                            ? TextStyleClass.normalStyle(fontSize: 2.5.sp, color: Colors.red)
                            : TextStyleClass.smallStyle(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        LanguageProvider.translate('buttons', 'cancel'),
                        style: Constants.isTablet
                            ? TextStyleClass.normalStyle(fontSize: 2.5.sp, color: Colors.black)
                            : TextStyleClass.smallStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
