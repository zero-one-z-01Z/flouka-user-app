import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/stores/domain/entity/store_entity.dart';

abstract class StoreRepo {
  Future<Either<DioException, List<StoreEntity>>> getStores();
}
