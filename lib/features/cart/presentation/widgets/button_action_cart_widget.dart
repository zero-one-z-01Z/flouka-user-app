import 'package:flutter/material.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:sizer/sizer.dart';

class ButtonsActionCartWidget extends StatelessWidget {
  final int count;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final double scale;

  const ButtonsActionCartWidget({
    super.key,
    this.count = 1,
    this.onAdd,
    this.onRemove,
    this.scale = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // spacing: width ?? 5.w,
        children: [
          _buildCartButton(
            icon: Icons.remove,
            onTap: onRemove,
            iconColor: Colors.black,
            color: const Color(0xffefeff3),
          ),
          Text(
            "$count",
            style: TextStyleClass.normalStyle().copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          _buildCartButton(
            icon: Icons.add,
            onTap: onAdd,
            color: Colors.black,
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildCartButton({
    required IconData icon,
    VoidCallback? onTap,
    required Color iconColor,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, color: iconColor, size: 16),
      ),
    );
  }
}
