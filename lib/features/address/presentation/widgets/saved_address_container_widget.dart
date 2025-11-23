import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/address/presentation/providers/address_provider.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../../domain/entities/address_entity.dart';

class SavedAddressContainerWidget extends StatelessWidget {
  final AddressEntity address;
  const SavedAddressContainerWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    final AddressProvider addressProvider = Provider.of<AddressProvider>(context);
    return GestureDetector(
      onTap: () {
        addressProvider.onSelectAddressEntity(address);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xfff1f1f1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: addressProvider.isAddressEntitySeleted(address)
                ? AppColor.primaryColor
                : Colors.transparent,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageProvider.translate("global", "Home"),
                  style: TextStyleClass.normalStyle(
                    color: AppColor.primaryColor,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
                const SvgWidget(svg: Images.addressEdit),
              ],
            ),
            const Divider(thickness: 1.5, color: Color(0xffe3e3e3)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10.w,
              children: [
                Column(
                  spacing: 2.5.h,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name",
                      style: TextStyleClass.normalStyle(
                        color: const Color(0xff595959),
                      ).copyWith(fontSize: 17.sp),
                    ),
                    Text(
                      LanguageProvider.translate("global", "Address"),
                      style: TextStyleClass.normalStyle(
                        color: const Color(0xff595959),
                      ).copyWith(fontSize: 17.sp),
                    ),
                    Text(
                      LanguageProvider.translate("global", "Mobile number"),
                      style: TextStyleClass.normalStyle(
                        color: const Color(0xff595959),
                      ).copyWith(fontSize: 17.sp),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 2.3.h,
                  children: [
                    Text("3omran ba4a", style: TextStyleClass.smallStyle()),
                    Text(address.addressName, style: TextStyleClass.smallStyle()),
                    Text("01229804760", style: TextStyleClass.smallStyle()),
                  ],
                ),
              ],
            ),

            // Row(
            //   spacing: 25.w,
            //   children: [
            //     Text(
            //       "Name",
            //       style: TextStyleClass.normalStyle(
            //         color: const Color(0xff595959),
            //       ).copyWith(fontSize: 17.sp),
            //     ),
            //     Text(
            //       "3omran ba4a",
            //       style: TextStyleClass.normalStyle().copyWith(fontSize: 15.sp),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 1.h),
            // Row(
            //   spacing: 25.w,
            //   children: [
            //     Text(
            //       LanguageProvider.translate("global", "Address"),
            //       style: TextStyleClass.normalStyle(
            //         color: const Color(0xff595959),
            //       ).copyWith(fontSize: 17.sp),
            //     ),
            //     Text(
            //       "3omran ba4a",
            //       style: TextStyleClass.normalStyle().copyWith(fontSize: 15.sp),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 1.h),
            // Row(
            //   spacing: 25.w,
            //   children: [
            //     Text(
            //       LanguageProvider.translate("global", "Mobile number"),
            //       style: TextStyleClass.normalStyle(
            //         color: const Color(0xff595959),
            //       ).copyWith(fontSize: 17.sp),
            //     ),
            //     Text(
            //       "3omran ba4a",
            //       style: TextStyleClass.normalStyle().copyWith(fontSize: 15.sp),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
