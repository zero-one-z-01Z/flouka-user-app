import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/entity/cart_entity.dart';
import '../../domain/entity/coupon_entity.dart';
import '../../domain/repo/cart_repo.dart';
import '../data_source/cart_remote_data_source.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource cartRemoteDataSource;
  CartRepoImpl(this.cartRemoteDataSource);

  @override
  Future<Either<DioException, CartEntity>> addToCart(
    Map<String, dynamic> data,
  ) async {
    return await cartRemoteDataSource.addToCart(data);
  }

  @override
  Future<Either<DioException, bool>> decreaseCart(
    Map<String, dynamic> data,
  ) async {
    return await cartRemoteDataSource.decreaseCart(data);
  }

  @override
  Future<Either<DioException, String>> deleteCart(
    Map<String, dynamic> data,
  ) async {
    return await cartRemoteDataSource.deleteCart(data);
  }

  @override
  Future<Either<DioException, bool>> deleteCartItem(
    Map<String, dynamic> data,
  ) async {
    return await cartRemoteDataSource.deleteCartItem(data);
  }

  @override
  Future<Either<DioException, List<CartEntity>>> getCart() async {
    return await cartRemoteDataSource.getCart();
  }

  @override
  Future<Either<DioException, bool>> increaseCart(
    Map<String, dynamic> data,
  ) async {
    return await cartRemoteDataSource.increaseCart(data);
  }

  @override
  Future<Either<DioException, CouponEntity>> getCoupon(
    Map<String, dynamic> data,
  ) async {
    return await cartRemoteDataSource.getCoupon(data);
  }
}
