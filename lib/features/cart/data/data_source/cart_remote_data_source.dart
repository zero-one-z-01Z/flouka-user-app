import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/helper_function/api.dart';
import 'package:flouka/features/cart/data/models/cart_model.dart';
import 'package:flouka/features/cart/data/models/coupon_model.dart';

class CartRemoteDataSource {
  final ApiHandel apiHandel;
  CartRemoteDataSource(this.apiHandel);
  // user products
  Future<Either<DioException, CartModel>> addToCart(
    Map<String, dynamic> data,
  ) async {
    var response = await ApiHandel.getInstance.post('user/carts', data);
    return response.fold((l) => Left(l), (r) {
      return Right(CartModel.fromJson(r.data['data']));
    });
  }

  Future<Either<DioException, bool>> increaseCart(Map<String, dynamic> data) async {
    var response = await ApiHandel.getInstance.post('user/increase_cart', data);
    return response.fold((l) => Left(l), (r) {
      return const Right(true);
    });
  }

  Future<Either<DioException, bool>> decreaseCart(Map<String, dynamic> data) async {
    var response = await ApiHandel.getInstance.post('user/decrease_cart', data);
    return response.fold((l) => Left(l), (r) {
      return const Right(true);
    });
  }

  Future<Either<DioException, bool>> deleteCartItem(
    Map<String, dynamic> data,
  ) async {
    var response = await ApiHandel.getInstance.post('user/delete_cart_item', data);
    return response.fold((l) => Left(l), (r) {
      return const Right(true);
    });
  }

  Future<Either<DioException, String>> deleteCart(Map<String, dynamic> data) async {
    var response = await ApiHandel.getInstance.post('user/delete_cart', data);
    return response.fold((l) => Left(l), (r) {
      return Right(r.data["data"]);
    });
  }

  Future<Either<DioException, List<CartModel>>> getCart() async {
    List<CartModel> cartModels = [];
    var response = await ApiHandel.getInstance.get("user/carts");
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        cartModels.add(CartModel.fromJson(i));
      }
      return Right(cartModels);
    });
  }

  Future<Either<DioException, CouponModel>> getCoupon(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.post('get_coupon', data);
    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        CouponModel order = CouponModel.fromJson(r.data['data']);
        return Right(order);
      },
    );
  }
}
