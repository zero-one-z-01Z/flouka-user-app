import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../entity/order_entity.dart';

abstract class OrderRepo {
  Future<Either<DioException, int>> createOrder(Map<String, dynamic> data);
  Future<Either<DioException, OrderEntity>> getUserOrderDetails(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, List<OrderEntity>>> getUserOrders(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, bool>> cancelOrder(Map<String, dynamic> data);
}
