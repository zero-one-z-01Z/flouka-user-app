import 'package:flouka/features/address/presentation/providers/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import 'delivery_dropdown_widget.dart';

class HomeAppbarWidget extends StatelessWidget {
  const HomeAppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressProvider addressProvider = Provider.of<AddressProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
        vertical: 1.h,
      ).copyWith(top: 7.h),
      child: Row(
        children: [
          const DeliveryDropdownWidget(),
          const Spacer(),
          const SvgWidget(svg: Images.search),
          SizedBox(width: 4.w),
          InkWell(
            onTap: () {
              addressProvider.goToAddressPage();
            },
            child: const SvgWidget(svg: Images.cart),
          ),
        ],
      ),
    );
  }
}
