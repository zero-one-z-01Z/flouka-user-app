import 'package:flouka/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:sizer/sizer.dart';

class ButtonsActionCartWidget extends StatelessWidget {
  final int count;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;
  final double scale;
  final num max;
  const ButtonsActionCartWidget({
    super.key,
    this.count = 1,
    this.onAdd,
    this.onRemove,
    required this.max,
    this.scale = 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // spacing: width ?? 5.w,
        children: [
          _buildCartButton(
            icon: Icons.remove,
            onTap: onRemove,
            iconColor: Colors.white,
            color:count >1 ? AppColor.primaryColor : const Color(0xffefeff3),
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
            color: count > max-1 ? const Color(0xffefeff3) : AppColor.primaryColor,
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
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 16),
      ),
    );
  }
}
