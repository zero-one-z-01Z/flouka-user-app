import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/repos/order_repo.dart';
import '../data_srouce/order_remote_data_source.dart';
import '../models/order_details_model.dart';
import '../models/order_model.dart';

class OrderRepoImpl implements OrderRepo {
  final OrderRemoteDataSource orderRemoteDataSource;
  OrderRepoImpl(this.orderRemoteDataSource);
  @override
  Future<Either<DioException, bool>> cancelOrder(Map<String, dynamic> data) {
    return orderRemoteDataSource.cancelOrder(data);
  }

  @override
  Future<Either<DioException, int>> createOrder(Map<String, dynamic> data) {
    return orderRemoteDataSource.createOrder(data);
  }

  @override
  Future<Either<DioException, OrderDetailsModel>> getUserOrderDetails(
    Map<String, dynamic> data,
  ) {
    return orderRemoteDataSource.getUserOrderDetails(data);
  }


  @override
  Future<Either<DioException, List<OrderModel>>> getUserOrders(
      Map<String, dynamic> data,
      ) {
    return orderRemoteDataSource.getUserOrders(data);
  }

  @override
  Future<Either<DioException, Map<String,dynamic>>> getUserOrderEditDetails(
    Map<String, dynamic> data,
  ) {
    return orderRemoteDataSource.getUserOrderEditDetails(data);
  }

  @override
  Future<Either<DioException, bool>> acceptOrderRules(Map<String, dynamic> data) {
    return orderRemoteDataSource.acceptOrderRules(data);
  }
}
