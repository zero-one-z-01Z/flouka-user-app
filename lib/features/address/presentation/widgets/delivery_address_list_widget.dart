import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/button_widget.dart';
import '../providers/address_details_provider.dart';
import '../providers/address_provider.dart';
import 'delivery_address_chekout.dart';

class DeliveryAddressListWidget extends StatelessWidget {
  const DeliveryAddressListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressProvider addressProvider = Provider.of(context);
    final AddressDetailsProvider addressDetailsProvider = Provider.of(context);
    return Column(
      spacing: 1.h,
      children: [
        ...List.generate(addressProvider.address.length, (index) {
          return DeliveryAddressCheckout(
            addressEntity: addressProvider.address[index],
          );
        }),
        ButtonWidget(
          onTap: () {
            addressDetailsProvider.goToAddressDetailsPage();
          },
          text: "add_address",
        ),
      ],
    );
  }
}
