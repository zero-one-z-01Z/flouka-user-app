import 'package:flutter/material.dart';
import '../../../products/domain/entity/product_entity.dart';

class OrderEntity {
  int? id;
  OrderStatus? status;
  num? price;
  String? createdAt;
  ProductEntity product;

  OrderEntity({
    required this.product,
    required this.id,
    required this.createdAt,
    required this.price,
    required this.status,
  });
}

enum OrderStatus {
  pending({
    "text": "pending",
    'title': 'pending_title',
    "des": "pending_des",
    "color": Color(0xff2D40AC),
    "details_color": Color(0xffE9A90A),
    "level": 1,
  }),
  accepted({
    "text": "confirmed",
    'title': 'accepted_title',
    "des": "accepted_des",
    "color": Colors.green,
    "details_color": Colors.green,
    "level": 4,
  }),
  inProgress({
    "text": "shipped",
    'title': 'in_progress_title',
    "des": "in_progress_des",
    "color": Color(0xff2D40AC),
    "details_color": Color(0xffE9A90A),
    "level": 7,
  }),
  // delivery({
  //   "text": "delivery",
  //   'title': 'delivery_title',
  //   "des": "delivery_des",
  //   'image': "order_in_progress.png",
  //   "color": Color(0xff2D40AC),
  //   "details_color": Color(0xffE9A90A),
  //   "level": 5.5,
  // }),
  completed({
    "text": "delivered",
    'title': 'completed_title',
    "des": "completed_des",
    "color": Colors.green,
    "details_color": Colors.green,
    "level": 10,
  }),
  cancelled({
    "text": "cancelled",
    'title': 'cancelled_title',
    "des": "cancelled_des",
    "color": Color(0xffB03329),
    "details_color": Color(0xffB03329),
    "level": 10,
  }),
  adminCancelled({
    "text": "admin_cancelled",
    'title': 'admin_cancelled_title',
    "des": "admin_cancelled_des",
    "color": Color(0xffB03329),
    "details_color": Color(0xffB03329),
    "level": 10,
  });

  final Map<String, dynamic> info;

  const OrderStatus(this.info);

  static OrderStatus getFromString(String text) {
    return OrderStatus.values.firstWhere((element) => element.info["text"] == text);
  }

  String get text => info["text"];
  num get level => info["level"];
  String get image => info["image"];
  String get title => info["title"];
  String get des => info["des"];
  Color get color => info["color"];
  Color get detailsColor => info["details_color"];
}
