import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/address/presentation/providers/address_details_provider.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/helper_function/location.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../navbar/presentation/provider/nav_bar_provider.dart';

class SelectDefaultAddressPage extends StatelessWidget {
  const SelectDefaultAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5.h,),
              Image.asset(AppImages.logo,width: 20.w,height: 20.w,),
              SizedBox(height: 10.h,),
              Image.asset(AppImages.locationImage,width: 40.w,height: 40.w,),
              SizedBox(height: 5.h,),
              Text(LanguageProvider.translate("address", "ask_address"),
                style: TextStyleClass.semiHeadStyle(),textAlign: TextAlign.center,),
              SizedBox(height: 4.h,),
              Row(
                children: [
                  Expanded(flex: 1,child: ButtonWidget(onTap: ()async{

                    LatLng? current = await determinePosition();
                    Provider.of<AuthProvider>(context,listen: false).setLatLng(current);
                    Provider.of<NavBarProvider>(context,listen: false).goToNavView();
                  }, text:LanguageProvider.translate("on_boarding", "skip"),color: Colors.grey,),),
                  SizedBox(width: 2.w,),
                  Expanded(flex: 2,child: ButtonWidget(onTap: (){
                    Provider.of<AddressDetailsProvider>(context,listen: false).goToAddressDetailsPage(firstAddress: true);
                  }, text: "add_new_address")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
