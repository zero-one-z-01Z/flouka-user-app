import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/entity/order_entity.dart';
import '../../domain/repos/order_repo.dart';
import '../data_srouce/order_remote_data_source.dart';

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
  Future<Either<DioException, OrderEntity>> getUserOrderDetails(
    Map<String, dynamic> data,
  ) {
    return orderRemoteDataSource.getUserOrderDetails(data);
  }

  @override
  Future<Either<DioException, List<OrderEntity>>> getUserOrders(
    Map<String, dynamic> data,
  ) {
    return orderRemoteDataSource.getUserOrders(data);
  }
}
