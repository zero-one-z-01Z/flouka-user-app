import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/address_entity.dart';
import '../providers/address_provider.dart';

class DeliveryAddressCheckout extends StatelessWidget {
  const DeliveryAddressCheckout({super.key, required this.addressEntity});
  final AddressEntity addressEntity;
  @override
  Widget build(BuildContext context) {
    final AddressProvider addressProvider = Provider.of(context);
    return InkWell(
      onTap: () {
        addressProvider.changeAddress(addressEntity);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: addressProvider.isSelected(addressEntity)
              ? Border.all(color: Colors.black)
              : null,
        ),
        child: ListTile(
          leading: const SvgWidget(svg: AppImages.location),
          title: Text(
            LanguageProvider.translate("global", "delivery_to"),
            style: TextStyleClass.normalStyle().copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          subtitle: Text(
            "${addressEntity.addressName} / ${addressEntity.streetName} ",
            style: TextStyleClass.normalStyle().copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
