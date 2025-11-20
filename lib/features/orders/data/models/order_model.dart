import '../../../../core/helper_function/convert.dart';
import '../../../address/data/model/address_model.dart';
import '../../domain/entity/order_entity.dart';
import 'order_details_model.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.orderDetails,
    required super.delivery,
    required super.id,
    required super.subTotal,
    required super.tax,
    required super.createdAt,
    required super.discount,
    required super.total,
    required super.status,
    required super.date,
    required super.phone,
    required super.name,
    required super.address,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    DateTime? date;
    AddressModel? address;
    List<OrderDetailsModel> orderDetails = [];

    if (json.containsKey('products') && json['products'] != null) {
      for (var i in json['products']) {
        orderDetails.add(OrderDetailsModel.fromJson(i));
      }
    }

    if (json.containsKey('date') && json['date'] != null) {
      date = DateTime.parse(json['date']);
    }

    if (json.containsKey('address') && json['address'] != null) {
      address = AddressModel.fromJson(json['address']);
    }

    return OrderModel(
      id: json['id'],
      subTotal: json['sub_total'],
      tax: json['tax'],
      orderDetails: orderDetails,
      discount: json['discount'],
      total: json['total'],
      delivery: json['delivery'],
      status: OrderStatus.getFromString(json['status']),
      createdAt: convertStringToDateTime(json['created_at']),
      date: date,
      phone: json['phone'],
      name: json['name'],
      address: address,
    );
  }
}
