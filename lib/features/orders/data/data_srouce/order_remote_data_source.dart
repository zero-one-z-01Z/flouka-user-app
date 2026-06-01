import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/helper_function/convert.dart';

import '../../../../core/helper_function/api.dart';
import '../models/order_details_model.dart';
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

  Future<Either<DioException, OrderDetailsModel>> getUserOrderDetails(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.post('user/get_user_order_details', data);
    return response.fold((l) => Left(l), (r) {
      return Right(OrderDetailsModel.fromJson(r.data['data']));
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

  Future<Either<DioException, Map<String,dynamic>>> getUserOrderEditDetails(Map<String, dynamic> data,) async {
    var response = await apiHandel.post('user/get_user_order_edit_details', data);
    return response.fold((l) => Left(l), (r) {
      Map<String,dynamic> data = {};
      List<OrderItemModel> orderModels = [];
      for (var i in r.data['data']) {
        orderModels.add(OrderItemModel.fromJson(i));
      }
      data['order_items'] = orderModels;
      data['total'] = convertDataToNum(r.data['meta'].toStringAsFixed(2));
      print('$data');
      return Right(data);
    });
  }


  Future<Either<DioException, bool>> cancelOrder(Map<String, dynamic> data) async {
    var response = await apiHandel.post('user/cancel_order', data);
    return response.fold((l) => Left(l), (r) {
      return Right(r.data['data']);
    });
  }
  Future<Either<DioException, bool>> acceptOrderRules(Map<String, dynamic> data) async {
    var response = await apiHandel.post('user/accept_order_rules', data);
    return response.fold((l) => Left(l), (r) {
      return Right(r.data['data']);
    });
  }
}
