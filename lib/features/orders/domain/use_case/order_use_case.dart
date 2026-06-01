import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../entity/order_details_entity.dart';
import '../entity/order_entity.dart';
import '../repos/order_repo.dart';

class OrderUseCase {
  final OrderRepo orderRepo;
  OrderUseCase(this.orderRepo);
  Future<Either<DioException, bool>> cancelOrder(Map<String, dynamic> data) {
    return orderRepo.cancelOrder(data);
  }

  Future<Either<DioException, int>> createOrder(Map<String, dynamic> data) {
    return orderRepo.createOrder(data);
  }

  Future<Either<DioException, OrderDetailsEntity>> getUserOrderDetails(
    Map<String, dynamic> data,
  ) {
    return orderRepo.getUserOrderDetails(data);
  }

  Future<Either<DioException, Map<String,dynamic>>> getUserOrderEditDetails(Map<String, dynamic> data,) {
    return orderRepo.getUserOrderEditDetails(data);
  }
  Future<Either<DioException, List<OrderEntity>>> getUserOrders(
    Map<String, dynamic> data,
  ) {
    return orderRepo.getUserOrders(data);
  }
  Future<Either<DioException, bool>> acceptOrderRules(Map<String, dynamic> data) {
    return orderRepo.acceptOrderRules(data);
  }
}
