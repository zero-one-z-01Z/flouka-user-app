import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/stores/domain/entity/store_entity.dart';
import 'package:flouka/features/stores/domain/repo/store_repo.dart';

import '../entity/store_details_entity.dart';

class StoreUseCase {
  final StoreRepo storeRepo;
  StoreUseCase(this.storeRepo);
  Future<Either<DioException, List<StoreEntity>>> getStores() async {
    return await storeRepo.getStores();
  }

  Future<Either<DioException, List<StoreEntity>>> getFollowedStores() async {
    return await storeRepo.getFollowedStores();
  }

  Future<Either<DioException, StoreDetailsEntity>> getStoreDetails(int id) async {
    return await storeRepo.getStoreDetails(id);
  }
}
