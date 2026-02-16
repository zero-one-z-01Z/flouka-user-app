import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/repo/cart_repo.dart';
import '../entity/cart_entity.dart';
import '../entity/coupon_entity.dart';

class CartUseCase {
  final CartRepo cartRepo;
  CartUseCase(this.cartRepo);

  Future<Either<DioException, CartEntity>> addToCart(
    Map<String, dynamic> data,
  ) async {
    return await cartRepo.addToCart(data);
  }

  Future<Either<DioException, bool>> decreaseCart(
    Map<String, dynamic> data,
  ) async {
    return await cartRepo.decreaseCart(data);
  }

  Future<Either<DioException, String>> deleteCart(
    Map<String, dynamic> data,
  ) async {
    return await cartRepo.deleteCart(data);
  }

  Future<Either<DioException, bool>> deleteCartItem(
    Map<String, dynamic> data,
  ) async {
    return await cartRepo.deleteCartItem(data);
  }

  Future<Either<DioException, List<CartEntity>>> getCart() async {
    return await cartRepo.getCart();
  }

  Future<Either<DioException, bool>> increaseCart(
    Map<String, dynamic> data,
  ) async {
    return await cartRepo.increaseCart(data);
  }

  Future<Either<DioException, CouponEntity>> getCoupon(
    Map<String, dynamic> data,
  ) async {
    return await cartRepo.getCoupon(data);
  }
}
