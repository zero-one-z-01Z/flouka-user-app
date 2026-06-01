import '../../../cart/data/models/coupon_model.dart';
import '../../domain/entity/order_details_entity.dart';
import '../../domain/entity/order_entity.dart';
import 'order_model.dart';

class OrderDetailsModel extends OrderDetailsEntity {
  OrderDetailsModel({
    super.id,
    super.userId,
    super.subTotal,
    super.tax,
    super.delivery,
    super.discount,
    super.deliveryPrice,
    super.total,
    super.addressId,
    super.paymentMethod,
    super.status,
    super.deletedAt,
    super.createdAt,
    super.updatedAt,
    super.address,
    super.coupon,
    super.vendorOrder,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    return OrderDetailsModel(
      id: json['id'],
      userId: json['user_id'],
      subTotal: (json['sub_total'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      delivery: (json['delivery'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      deliveryPrice: (json['delivery_price'] as num?)?.toDouble(),
      total: (json['total'] as num?)?.toDouble(),
      addressId: json['address_id'],
      paymentMethod: json['payment_method'],
      status: OrderStatus.getFromString(json['status']),
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      address: json['address'] != null
          ? AddressModel.fromJson(json['address'])
          : null,
      coupon: json['coupon'] != null
          ? CouponModel.fromJson(json['coupon'])
          : null,
      vendorOrder: json['vendor_order'] != null
          ? VendorOrderModel.fromJson(json['vendor_order'])
          : null,
    );
  }

  factory OrderDetailsModel.fromMap(Map<String, dynamic> json) {
    return OrderDetailsModel.fromJson(json['data']);
  }
}