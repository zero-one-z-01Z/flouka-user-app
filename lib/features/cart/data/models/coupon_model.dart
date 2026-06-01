import 'package:flouka/core/helper_function/convert.dart';

import '../../domain/entity/coupon_entity.dart';

class CouponModel extends CouponEntity {
  const CouponModel({
    required super.id,
    required super.name,
    required super.coupon,
    required super.value,
    required super.min,
    required super.discount,
    required super.type,
    required super.max,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      id: json['id'],
      name: json['name']??"",
      coupon: json['coupon'],
      value: convertDataToNum(json['value'])??0,
      min: convertDataToNum(json['min']),
      discount: convertDataToNum(json['discount']),
      max:convertDataToNum(json['max']),
      type: json['type']??"",
    );
  }
}
