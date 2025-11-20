import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key, this.withoutArrow});
  final bool? withoutArrow;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const Icon(Icons.location_on),
        title: Text(
          LanguageProvider.translate("global", "delivery_to"),
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        subtitle: const Text(
          "المنزل / الرياض / قطعة ١٤ خلف مسجد ...",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: withoutArrow == true
            ? null
            : const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
