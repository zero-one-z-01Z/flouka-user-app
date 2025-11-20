import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
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
          leading: const Icon(Icons.location_on),
          title: Text(
            LanguageProvider.translate("global", "delivery_to"),
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          subtitle: Text(
            "${addressEntity.addressName} / ${addressEntity.streetName} ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
