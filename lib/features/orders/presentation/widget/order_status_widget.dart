import 'package:flutter/material.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:sizer/sizer.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildStep(
            date: "14 أكتوبر",
            title: LanguageProvider.translate("global", "order_accepted"),
            icon: Icons.check_circle,
            iconColor: Colors.green,
            isCompleted: true,
            isLast: false,
          ),

          _buildStep(
            date: "14 أكتوبر",
            title: LanguageProvider.translate("global", "order_shipped"),
            description:
                "تم إرسال شحنتك إلى المركز النهائي. سنرسل لك إشعارًا عند إرسالها للتسليم. بعد أن تكون شحنتك جاهزة للتسليم ونكون على وشك الوصول، نعرض لك رقم هاتف شركة الشحن.",
            icon: Icons.local_shipping,
            iconColor: Colors.green,
            isCompleted: true,
            isLast: false,
          ),

          _buildStep(
            date: "17 أكتوبر",
            title: LanguageProvider.translate("global", "order_delivered"),
            icon: Icons.inventory_2_outlined,
            iconColor: Colors.grey,
            isCompleted: false,
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required String date,
    required String title,
    IconData? icon,
    required Color iconColor,
    String? description,
    bool? isCompleted,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: isCompleted == true ? 6.w : 4.w,
              ),
            ),
            if (!isLast)
              Container(width: 2, height: 8.w, color: Colors.grey.shade300),
          ],
        ),

        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyleClass.normalStyle().copyWith(
                  color: iconColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              if (description != null)
                Text(
                  description,
                  style: TextStyleClass.normalStyle().copyWith(
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
              if (description != null) const SizedBox(height: 10),
            ],
          ),
        ),
        Text(
          date,
          style: TextStyleClass.normalStyle().copyWith(
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
