import 'package:flutter/material.dart';
import '../../../../core/config/app_styles.dart';
import 'order_price_details_widget.dart';

class OrderPriceExpansionTileWidget extends StatefulWidget {
  const OrderPriceExpansionTileWidget({
    super.key,
    required this.title,
    required this.info,
  });

  final String title;
  final String info;

  @override
  State<OrderPriceExpansionTileWidget> createState() =>
      _OrderPriceExpansionTileWidgetState();
}

class _OrderPriceExpansionTileWidgetState
    extends State<OrderPriceExpansionTileWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      showTrailingIcon: false,
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.zero,
      textColor: Colors.black,
      collapsedIconColor: Colors.black,
      trailing: const SizedBox.shrink(),
      onExpansionChanged: (expanded) {
        setState(() {
          _isExpanded = expanded;
        });
      },
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Text(
              widget.title,
              style: TextStyleClass.normalStyle().copyWith(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Text(
              widget.info,
              style: TextStyleClass.normalStyle().copyWith(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            AnimatedRotation(
              turns: _isExpanded ? -0.5 : 0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: const Icon(Icons.arrow_downward),
            ),
          ],
        ),
      ),
      children: [const OrderPriceDetailsWidget()],
    );
  }
}
