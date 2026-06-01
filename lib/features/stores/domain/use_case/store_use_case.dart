import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/stores/domain/entity/store_entity.dart';
import 'package:flouka/features/stores/domain/repo/store_repo.dart';

import '../../../products/domain/entity/product_review_entity.dart';
import '../entity/store_details_entity.dart';

class StoreUseCase {
  final StoreRepo storeRepo;
  StoreUseCase(this.storeRepo);
  Future<Either<DioException, List<StoreEntity>>> getStores(Map<String,dynamic> data) async {
    return await storeRepo.getStores(data);
  }

  Future<Either<DioException, List<StoreEntity>>> getFollowedStores() async {
    return await storeRepo.getFollowedStores();
  }

  Future<Either<DioException, StoreDetailsEntity>> getStoreDetails(Map<String,dynamic> data) async {
    return await storeRepo.getStoreDetails(data);
  }

  Future<Either<DioException, bool>> updateFollow(Map<String,dynamic> data) async {
    return await storeRepo.updateFollow(data);
  }
  Future<Either<DioException, List<ProductReviewEntity>>> getReviews(Map<String,dynamic> data) async {
    return await storeRepo.getReviews(data);
  }
}
