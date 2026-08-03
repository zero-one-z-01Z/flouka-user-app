import 'package:country_code_picker/country_code_picker.dart';
import 'package:flouka/features/address/presentation/providers/address_details_provider.dart';
import 'package:flouka/features/auth/presentation/providers/complete_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:provider/provider.dart';
import '../../../../core/config/app_styles.dart';
import '../providers/auth_provider.dart';
import '../providers/otp_provider.dart';

String defaultCountry = '+216';
int phoneLength = 8;
class CountryWidget extends StatelessWidget {
  const CountryWidget({super.key,required this.onChange});
  final void Function(CountryCode?) onChange;
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of(context);
    print(authProvider.userEntity?.phoneCode);
    return CountryCodePicker(
      onChanged: onChange,
      showFlagMain: false,
      textStyle:TextStyleClass.semiHeadStyle(),
      showFlag: true,
      initialSelection: authProvider.userEntity?.phoneCode!=null ?
      (CountryCode.fromDialCode("+${authProvider.userEntity!.phoneCode!}").code):defaultCountry,
      hideSearch: false,
      showCountryOnly: false,backgroundColor: Colors.black,
      showOnlyCountryWhenClosed: false,
      alignLeft: false,
    );
  }
  static int get getLength{
    String digit = defaultCountry.replaceAll("+",'');
    final data = CountryManager().countries
        .firstWhere((e) {
          return e.phoneCode == digit;
    });

    phoneLength = data.exampleNumberMobileNational.replaceAll(' ', '').length;
    print("data.exampleNumberMobileNational");
    print(data.exampleNumberMobileNational);
    return phoneLength;
  }
}


// login
// update profile
// address