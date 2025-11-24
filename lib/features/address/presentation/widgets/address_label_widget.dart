import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/widgets/svg_widget.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entities/address_label_entity.dart';
import '../providers/address_provider.dart';

class AddressLabelWidget extends StatelessWidget {
  const AddressLabelWidget({super.key, required this.addressLabelEntity});

  final AddressLabelEntity addressLabelEntity;

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);
    bool isSelected = addressProvider.isLabelSelected(addressLabelEntity.label);
    return InkWell(
      onTap: () {
        addressProvider.changeLabel(addressLabelEntity.label);
      },
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: .7.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor : Colors.white,
          border: Border.all(
            color: isSelected ? AppColor.primaryColor : Colors.grey,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        duration: const Duration(milliseconds: 300),
        child: Row(
          children: [
            SvgWidget(
              svg: addressLabelEntity.svg,
              color: isSelected ? Colors.white : Colors.grey,
            ),
            SizedBox(width: 1.w),
            Text(
              LanguageProvider.translate("global", addressLabelEntity.label),
              style: TextStyleClass.smallStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
