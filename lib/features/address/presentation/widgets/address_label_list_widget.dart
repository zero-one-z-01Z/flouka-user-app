import 'package:flouka/features/address/presentation/providers/address_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'address_label_widget.dart';

class AddressLabelListWidget extends StatelessWidget {
  const AddressLabelListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final addressProvider = Provider.of<AddressProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 2.w,
        children: List.generate(
          addressProvider.labels.length,
          (index) =>
              AddressLabelWidget(addressLabelEntity: addressProvider.labels[index]),
        ),
      ),
    );
  }
}
