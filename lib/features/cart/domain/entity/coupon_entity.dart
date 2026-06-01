import 'package:equatable/equatable.dart';

class CouponEntity extends Equatable {
  final int id;
  final String name;
  final String coupon;
  final num value;
  final num? min;
  final num? max;
  final num? discount;
  final String type;

  const CouponEntity({required this.id, required this.name,required this.discount, required this.coupon, required this.value, required this.min, this.max, required this.type});

  @override
  List<Object?> get props => [id, name, coupon, value, min, max, type];
}