import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/config/app_color.dart';
import '../../domain/entities/address_entity.dart';

class SavedAddressContainerWidget extends StatelessWidget {
  final AddressEntity address;
  const SavedAddressContainerWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Image.network(
              'https://picsum.photos/200/200',
              width: 10.w,
              height: 4.h,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 2.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.addressName,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColor.primaryColor,
                  ),
                ),
                Text(
                  address.streetName,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const Spacer(),
            Icon(Icons.my_location, color: AppColor.primaryColor),
          ],
        ),
      ),
    );
  }
}
