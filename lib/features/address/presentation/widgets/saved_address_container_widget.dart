import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_color.dart';
import '../../domain/entities/address_entity.dart';
import '../providers/address_details_provider.dart';
import '../providers/address_provider.dart';

class SavedAddressContainerWidget extends StatelessWidget {
  final AddressEntity address;
  const SavedAddressContainerWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    final addressProvider = context.read<AddressProvider>();
    final auth = context.read<AuthProvider>();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color:const Color(0xffF1F1F1),borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Text(address.addressName ?? "Address Name", style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColor.primaryColor,
              ),)),
              InkWell(
                onTap: (){
                  Provider.of<AddressDetailsProvider>(context,listen: false).goToAddressDetailsPage(addressEntity: address);
                },
                child:  Icon(Icons.edit, color: AppColor.primaryColor),
              ),
              SizedBox(width: 2.w),
              if(address.isDefault == false)
              InkWell(
                onTap: () => addressProvider.deleteAddress(address.id!),
                child: const Icon(Icons.delete, color: Colors.red),
              ),

            ],
          ),
          Container(color: Colors.grey.shade300, height: 0.2.h,width: 100.w,margin: EdgeInsets.symmetric(vertical:1.h),),
          Row(
            children: [
              Expanded(
                child: Text(LanguageProvider.translate("address", "name"),style: TextStyleClass.normalStyle(
                    color: const Color(0xff595959)
                ),),
              ),
              SizedBox(width: 2.w),
              Expanded(child: Text(auth.userEntity?.name ?? "",style: TextStyleClass.normalStyle(),)),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(LanguageProvider.translate("address", "address"),style: TextStyleClass.normalStyle(
                    color: const Color(0xff595959)
                ),),
              ),
              SizedBox(width: 2.w),
              Expanded(child: Text(address.address ?? "",style: TextStyleClass.normalStyle(),)),
            ],
          ),
          Row(
            children: [
              Expanded(child: Text(LanguageProvider.translate("address", "phone"),style: TextStyleClass.normalStyle(
                  color: const Color(0xff595959)
              ),)),
              SizedBox(width: 2.w),
              Expanded(child: Text(address.phone ?? "",style: TextStyleClass.normalStyle(),)),
            ],
          ),

        ],
      ),
    );
  }
}
