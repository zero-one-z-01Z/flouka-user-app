import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/helper_function/api.dart';
import 'package:flouka/features/stores/data/data/store_model.dart';

import '../../../products/data/models/product_review_model.dart';
import '../data/store_details_model.dart';

class StoreRemoteDataSource {
  final ApiHandel apiHandel;
  StoreRemoteDataSource(this.apiHandel);
  Future<Either<DioException, List<StoreModel>>> getStores(Map<String,dynamic> data) async {
    List<StoreModel> storeModels = [];
    var response = await ApiHandel.getInstance.post('get_stores',data);
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        storeModels.add(StoreModel.fromJson(i));
      }
      return Right(storeModels);
    });
  }

  Future<Either<DioException, List<ProductReviewModel>>> getReviews(Map<String,dynamic> data) async {
    List<ProductReviewModel> storeModels = [];
    var response = await ApiHandel.getInstance.get('stores/reviews',data);
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        storeModels.add(ProductReviewModel.fromJson(i));
      }
      return Right(storeModels);
    });
  }

  Future<Either<DioException, List<StoreModel>>> getFollowedStores() async {
    List<StoreModel> storeModels = [];
    var response = await ApiHandel.getInstance.get('user/store/followed-stores');
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        storeModels.add(StoreModel.fromJson(i));
      }
      return Right(storeModels);
    });
  }

  Future<Either<DioException, StoreDetailsModel>> getStoreDetails(Map<String,dynamic> data) async {
    StoreDetailsModel storeModels;
    var response = await ApiHandel.getInstance.post('get_store_details',data);
    return response.fold((l) => Left(l), (r) {
      storeModels = StoreDetailsModel.fromJson(r.data['data']);
      return Right(storeModels);
    });
  }

  Future<Either<DioException, bool>> follow(int id) async {
    StoreDetailsModel storeModels;
    var response = await ApiHandel.getInstance.post('user/store/$id/follow', {});
    return response.fold((l) => Left(l), (r) {
      storeModels = StoreDetailsModel.fromJson(r.data['data']);
      return const Right(true);
    });
  }

  Future<Either<DioException, bool>> unfollow(int id) async {
    StoreDetailsModel storeModels;
    var response = await ApiHandel.getInstance.post('user/store/$id/unfollow', {});
    return response.fold((l) => Left(l), (r) {
      storeModels = StoreDetailsModel.fromJson(r.data['data']);
      return const Right(true);
    });
  }
}
