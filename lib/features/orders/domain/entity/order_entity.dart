import 'package:flutter/material.dart';
import 'package:flouka/features/orders/domain/entity/order_details_entity.dart';
import '../../../../core/helper_function/convert.dart';
import '../../../address/domain/entities/address_entity.dart';

class OrderEntity {
  int? id;
  OrderStatus? status;
  num? subTotal;
  num? tax;
  num? discount;
  num? total;
  num? delivery;
  DateTime? date;
  DateTime? createdAt;
  String? phone;
  String? name;
  AddressEntity? address;
  List<OrderDetailsEntity> orderDetails;

  late List<String> infoList = [
    total?.toString() ?? "",
    id?.toString() ?? "",
    address?.addressName ?? '',
    createdAt != null ? convertDateTimeToString(createdAt!) : "",
  ];

  OrderEntity({
    required this.orderDetails,
    required this.id,
    required this.subTotal,
    required this.tax,
    required this.createdAt,
    required this.discount,
    required this.total,
    required this.delivery,
    required this.status,
    required this.date,
    required this.phone,
    required this.name,
    required this.address,
  });
  OrderDetailsEntity getFirtstProduct() => orderDetails.first;
}

enum OrderStatus {
  pending({
    "text": "pending",
    "color": Color(0xff2D40AC),
    "details_color": Color(0xffE9A90A),
    "level": 1,
  }),

  accepted({
    "text": "accepted",
    "color": Color(0xff2D40AC),
    "details_color": Color(0xffE9A90A),
    "level": 4,
  }),
  inProgress({
    "text": "in_progress",
    "color": Color(0xff2D40AC),
    "details_color": Color(0xffE9A90A),
    "level": 7,
  }),
  delivery({
    "text": "delivery",
    "color": Color(0xff2D40AC),
    "details_color": Color(0xffE9A90A),
    "level": 5.5,
  }),

  completed({
    "text": "completed",
    "color": Colors.green,
    "details_color": Colors.green,
    "level": 10,
  }),
  cancelled({
    "text": "cancelled",
    "color": Color(0xffB03329),
    "details_color": Color(0xffB03329),
    "level": 10,
  }),
  adminCancelled({
    "text": "admin_cancelled",
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
  Color get color => info["color"];
  Color get detailsColor => info["details_color"];
}
