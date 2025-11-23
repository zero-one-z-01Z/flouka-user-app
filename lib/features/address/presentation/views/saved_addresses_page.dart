import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/loading_animation_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/address_provider.dart';
import '../providers/map_provider.dart';
import '../widgets/saved_address_container_widget.dart';

class SavedAddressesPage extends StatelessWidget {
  const SavedAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addressProvider = context.watch<AddressProvider>();
    final MapProvider mapProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(LanguageProvider.translate('global', 'address'))),

      body: Builder(
        builder: (context) {
          if (addressProvider.address.isEmpty) {
            return const Center(child: LoadingAnimationWidget(gif: Lotties.loading));
          }
          return Column(
            children: [
              SizedBox(height: 2.h),
              BorderButtonWidget(
                onTap: () {
                  mapProvider.goToMapPage();
                },
                text: "ADD NEW ADDRESS",
                textStyle: TextStyleClass.normalStyle(
                  color: AppColor.primaryColor,
                ).copyWith(fontWeight: FontWeight.bold).copyWith(fontSize: 15.sp),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: addressProvider.address.length,
                  itemBuilder: (context, index) {
                    final address = addressProvider.address[index];
                    return SavedAddressContainerWidget(address: address);
                  },
                ),
              ),
            ],
          );
        },
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.sp, vertical: 5.h),
        child: ButtonWidget(
          onTap: () {
            mapProvider.goToMapPage();
          },
          text: "apply",
          height: 7.h,
          borderRadius: 12,
        ),
      ),
    );
  }
}
