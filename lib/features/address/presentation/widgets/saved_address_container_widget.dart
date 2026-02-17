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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(color: Color(0xffE7F3E5)),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Provider.of<AddressDetailsProvider>(context,listen: false).goToAddressDetailsPage(addressEntity: address);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
              decoration: const BoxDecoration(color: Colors.black),
              child: const Icon(Icons.edit, color: Colors.white),
            ),
          ),
          SizedBox(width: 2.w),
          InkWell(
            onTap: () => addressProvider.deleteAddress(address.id!),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 1.w),
              decoration: const BoxDecoration(color: Colors.red),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
          ),
          SizedBox(width: 2.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address.addressName ?? "Address Name",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColor.primaryColor,
                ),
              ),
              Text(
                address.streetName ?? "Streat name ",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
          const Spacer(),
          Icon(Icons.my_location, color: AppColor.primaryColor),
        ],
      ),
    );
  }
}
