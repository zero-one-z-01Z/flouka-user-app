import 'package:flutter/material.dart';

import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/address_entity.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key, required this.addressEntity});
  final AddressEntity addressEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: const SvgWidget(svg: AppImages.location),
        title: Text(
          LanguageProvider.translate("global", "delivery_to"),
          style: TextStyleClass.normalStyle().copyWith(color: Colors.grey),
        ),
        subtitle: Text(
          addressEntity.addressName ?? "Mohsen hendawy",
          style: TextStyleClass.normalStyle().copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
