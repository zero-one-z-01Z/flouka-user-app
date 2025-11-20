import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderStatusTimeLine extends StatelessWidget {
  const OrderStatusTimeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildTimelineTile(
            isFirst: true,
            isLast: false,
            title: "تم قبول طلبك",
            date: "14 أكتوبر",
            icon: Icons.check_circle,
            iconColor: Colors.green,
          ),
          _buildTimelineTile(
            isFirst: false,
            isLast: false,
            title: "تم شحن طلبك",
            date: "14 أكتوبر",
            description:
                "تم إرسال شحنتك إلى المركز النهائي. سنرسل لك إشعارًا عند إرسالها للتسليم. بعد أن تكون شحنتك جاهزة للتسليم ونكون على وشك الوصول، نعرض لك رقم هاتف شركة الشحن.",
            icon: Icons.local_shipping,
            iconColor: Colors.green,
          ),
          _buildTimelineTile(
            isFirst: false,
            isLast: true,
            title: "توقع التوصيل",
            date: "17 أكتوبر",
            icon: Icons.inventory_2_outlined,
            iconColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineTile({
    required bool isFirst,
    required bool isLast,
    required String title,
    required String date,
    required IconData icon,
    required Color iconColor,
    String? description,
  }) {
    final bool isActive = iconColor == Colors.green;

    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.08,
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(
        width: isActive ? 44 : 36,
        height: isActive ? 44 : 36,
        padding: const EdgeInsets.only(top: 6),
        indicator: Container(
          decoration: BoxDecoration(
            color: iconColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(icon, color: iconColor, size: isActive ? 26 : 20),
          ),
        ),
      ),
      beforeLineStyle: LineStyle(color: Colors.grey.shade300, thickness: 2),
      afterLineStyle: LineStyle(color: Colors.grey.shade300, thickness: 2),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: iconColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            if (description != null) ...[
              const SizedBox(height: 6),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
