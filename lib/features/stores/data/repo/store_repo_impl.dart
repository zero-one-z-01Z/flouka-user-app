import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/stores/data/data_source/store_remote_data_source.dart';
import 'package:flouka/features/stores/domain/repo/store_repo.dart';

import '../../../products/data/models/product_review_model.dart';
import '../../domain/entity/store_details_entity.dart';
import '../../domain/entity/store_entity.dart';

class StoreRepoImpl implements StoreRepo {
  StoreRepoImpl(this.storeRemoteDataSource);
  final StoreRemoteDataSource storeRemoteDataSource;
  @override
  Future<Either<DioException, List<StoreEntity>>> getStores(Map<String , dynamic> data) async {
    return await storeRemoteDataSource.getStores(data);
  }

  @override
  Future<Either<DioException, List<ProductReviewModel>>> getReviews(Map<String , dynamic> data) async {
    return await storeRemoteDataSource.getReviews(data);
  }

  @override
  Future<Either<DioException, List<StoreEntity>>> getFollowedStores() async {
    return await storeRemoteDataSource.getFollowedStores();
  }

  @override
  Future<Either<DioException, StoreDetailsEntity>> getStoreDetails(Map<String,dynamic> data) async {
    return await storeRemoteDataSource.getStoreDetails(data);
  }

  @override
  Future<Either<DioException, bool>> follow(int id) async {
    return await storeRemoteDataSource.follow(id);
  }

  @override
  Future<Either<DioException, bool>> unfollow(int id) async {
    return await storeRemoteDataSource.unfollow(id);
  }
}
