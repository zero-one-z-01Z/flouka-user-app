import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../entity/cart_entity.dart';
import '../entity/coupon_entity.dart';

abstract class CartRepo {
  Future<Either<DioException, CartEntity>> addToCart(Map<String, dynamic> data);
  Future<Either<DioException, bool>> decreaseAndIncreaseCart(Map<String, dynamic> data);
  Future<Either<DioException, bool>> deleteCartItem(Map<String, dynamic> data);
  Future<Either<DioException, String>> deleteCart(Map<String, dynamic> data);
  Future<Either<DioException, List<CartEntity>>> getCart();
  Future<Either<DioException, CouponEntity>> getCoupon(Map<String, dynamic> data);
}
