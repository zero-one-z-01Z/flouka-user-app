import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/drop_down_widget.dart';
import '../../../../core/widgets/list_text_field_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/address_details_provider.dart';
import '../providers/area_provider.dart';
import '../providers/city_provider.dart';
import '../providers/parts_provider.dart';

class AddressBottomSheet extends StatelessWidget {
  const AddressBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final addressDetailsProvider = Provider.of<AddressDetailsProvider>(context);
    final cityProvider = Provider.of<CityProvider>(context, listen: false);
    final areaProvider = Provider.of<AreaProvider>(context, listen: false);
    final partsProvider = Provider.of<PartsProvider>(context, listen: false);

    return SafeArea(
      child: Form(
        key: addressDetailsProvider.formKey,
        child: Container(
          constraints: BoxConstraints(maxHeight: 65.h),
          padding: EdgeInsets.symmetric(
            horizontal: 6.w,
            vertical: 3.h,
          ).add(EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom)),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, -2)),
            ],
          ),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Center(
                  child: Text(
                    LanguageProvider.translate('inputs', 'order_location'),
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                SizedBox(height: 3.h),
      
                // Dropdowns
                _buildSectionTitle(context, 'inputs', 'government'),
                DropDownWidget(
                  dropDownClass: cityProvider,
                  color: Colors.white,
                  borderColor: AppColor.primaryColor.withValues(alpha: .3),
                ),
                SizedBox(height: 2.h),
      
                _buildSectionTitle(context, 'inputs', 'city'),
                DropDownWidget(
                  dropDownClass: areaProvider,
                  color: Colors.white,
                  borderColor: AppColor.primaryColor.withValues(alpha: .3),
                ),
                SizedBox(height: 2.h),
      
                // _buildSectionTitle(context, 'inputs', 'part'),
                // DropDownWidget(
                //   dropDownClass: partsProvider,
                //   color: AppColor.backgroundColor,
                //   borderColor: AppColor.primaryColor.withValues(alpha: .3),
                // ),
                SizedBox(height: 3.h),
      
                // Text Fields
                ListTextFieldWidget(inputs: addressDetailsProvider.inputs),
                SizedBox(height: 3.h),
      
                // Save Button
                SizedBox(
                  width: double.infinity,
                  child: ButtonWidget(
                    onTap: () {
                      if (addressDetailsProvider.formKey.currentState!.validate() &&
                          cityProvider.cityEntity != null &&
                          areaProvider.areaEntity != null) {
                        addressDetailsProvider.addressButtonAction();
                      } else {
                        addressDetailsProvider.submitAddressForm();
                      }
                    },
                    text: 'save_and_continue',
                    borderRadius: 12,
                    height: 6.5.h,
                  ),
                ),
                SizedBox(height: 1.h),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String mainKey, String subKey) {
    return Padding(
      padding: EdgeInsets.only(bottom: 1.h),
      child: Text(
        LanguageProvider.translate(mainKey, subKey),
        style: TextStyleClass.normalStyle().copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
