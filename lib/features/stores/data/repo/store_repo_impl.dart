import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/stores/data/data_source/store_remote_data_source.dart';
import 'package:flouka/features/stores/domain/repo/store_repo.dart';

import '../../domain/entity/store_details_entity.dart';
import '../../domain/entity/store_entity.dart';

class StoreRepoImpl implements StoreRepo {
  StoreRepoImpl(this.storeRemoteDataSource);
  final StoreRemoteDataSource storeRemoteDataSource;
  @override
  Future<Either<DioException, List<StoreEntity>>> getStores() async {
    return await storeRemoteDataSource.getStores();
  }

  @override
  Future<Either<DioException, List<StoreEntity>>> getFollowedStores() async {
    return await storeRemoteDataSource.getFollowedStores();
  }

  @override
  Future<Either<DioException, StoreDetailsEntity>> getStoreDetails(int id) async {
    return await storeRemoteDataSource.getStoreDetails(id);
  }
}
