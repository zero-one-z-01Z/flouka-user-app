import 'package:flutter/material.dart';

import '../../../../core/config/app_styles.dart';

class OrderInfoItemWidget extends StatelessWidget {
  const OrderInfoItemWidget({
    super.key,
    required this.title,
    required this.info,
  });

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyleClass.normalStyle(),
          ),
          Text(
            info,
            style: TextStyleClass.normalStyle(),
          ),
        ],
      ),
    );
  }
}
