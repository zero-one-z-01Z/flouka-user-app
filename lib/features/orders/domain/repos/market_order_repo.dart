import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../entity/order_entity.dart';

abstract class MarketOrderRepo {
  Future<Either<DioException, OrderEntity>> getMarketOrderDetails(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, List<OrderEntity>>> getMarketOrders(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, bool>> updateMarketOrderStatus(
    Map<String, dynamic> data,
  );
}
