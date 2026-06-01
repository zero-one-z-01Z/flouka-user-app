import '../../../cart/domain/entity/coupon_entity.dart';
import 'order_entity.dart';

class OrderDetailsEntity {
  final int? id;
  final int? userId;
  final double? subTotal;
  final double? tax;
  final double? delivery;
  final double? discount;
  final double? deliveryPrice;
  final double? total;
  final int? addressId;
  final String? paymentMethod;
  OrderStatus? status;
  final dynamic deletedAt;
  final String? createdAt;
  final String? updatedAt;
  final AddressEntity? address;
  final CouponEntity? coupon;
  final VendorOrderEntity? vendorOrder;

  OrderDetailsEntity({
    this.id,
    this.userId,
    this.subTotal,
    this.tax,
    this.delivery,
    this.discount,
    this.deliveryPrice,
    this.total,
    this.addressId,
    this.paymentMethod,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.address,
    this.coupon,
    this.vendorOrder,
  });
}

