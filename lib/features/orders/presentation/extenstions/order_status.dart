import 'package:flutter/widgets.dart';

import '../../../../core/config/app_color.dart';

enum OrderStatus {
  pending,
  accepted,
  in_progress,
  delivery,
  cancelled,
  completed,
  admin_cancelled,
}

extension OrderStatusExtension on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.pending:
        return "pending";
      case OrderStatus.accepted:
        return "accepted";
      case OrderStatus.in_progress:
        return "in_delivery";
      case OrderStatus.delivery:
        return "delivered";
      case OrderStatus.cancelled:
        return "cancelled";
      case OrderStatus.admin_cancelled:
        return "admin_cancelled";
      case OrderStatus.completed:
        return "completed";
    }
  }

  Color get color {
    switch (this) {
      case OrderStatus.pending:
        return AppColor.primaryColor;
      case OrderStatus.accepted:
        return AppColor.primaryColor;
      case OrderStatus.in_progress:
        return AppColor.primaryColor;
      case OrderStatus.delivery:
        return AppColor.primaryColor;
      case OrderStatus.cancelled:
        return AppColor.primaryColor;
      case OrderStatus.admin_cancelled:
        return AppColor.primaryColor;
      case OrderStatus.completed:
        return AppColor.primaryColor;
    }
  }
}
