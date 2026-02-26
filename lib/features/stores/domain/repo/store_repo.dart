import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/stores/domain/entity/store_details_entity.dart';
import 'package:flouka/features/stores/domain/entity/store_entity.dart';

abstract class StoreRepo {
  Future<Either<DioException, List<StoreEntity>>> getStores();
  Future<Either<DioException, List<StoreEntity>>> getFollowedStores();
  Future<Either<DioException, StoreDetailsEntity>> getStoreDetails(int id);
  Future<Either<DioException, bool>> follow(int id);
  Future<Either<DioException, bool>> unfollow(int id);
}
