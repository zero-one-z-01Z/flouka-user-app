import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/helper_function/api.dart';
import '../models/order_model.dart';

class OrderRemoteDataSource {
  final ApiHandel apiHandel;
  OrderRemoteDataSource(this.apiHandel);

  Future<Either<DioException, int>> createOrder(Map<String, dynamic> data) async {
    var response = await apiHandel.post('user/create_order', data);
    return response.fold((l) => Left(l), (r) {
      return Right(r.data['data']);
    });
  }

  Future<Either<DioException, OrderModel>> getUserOrderDetails(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.post('user/get_user_order_details', data);
    return response.fold((l) => Left(l), (r) {
      return Right(OrderModel.fromJson(r.data['data']));
    });
  }

  Future<Either<DioException, List<OrderModel>>> getUserOrders(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.post('user/get_user_orders', data);
    return response.fold((l) => Left(l), (r) {
      List<OrderModel> orderModels = [];
      for (var i in r.data['data']) {
        orderModels.add(OrderModel.fromJson(i));
      }
      return Right(orderModels);
    });
  }

  Future<Either<DioException, bool>> cancelOrder(Map<String, dynamic> data) async {
    var response = await apiHandel.post('user/user_cancel_order', data);
    return response.fold((l) => Left(l), (r) {
      return Right(r.data['data']);
    });
  }
}
