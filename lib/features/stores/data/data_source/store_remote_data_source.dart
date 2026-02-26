import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/helper_function/api.dart';
import 'package:flouka/features/stores/data/data/store_model.dart';

import '../data/store_details_model.dart';

class StoreRemoteDataSource {
  final ApiHandel apiHandel;
  StoreRemoteDataSource(this.apiHandel);
  Future<Either<DioException, List<StoreModel>>> getStores() async {
    List<StoreModel> storeModels = [];
    var response = await ApiHandel.getInstance.get('stories');
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        storeModels.add(StoreModel.fromJson(i));
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

  Future<Either<DioException, StoreDetailsModel>> getStoreDetails(int id) async {
    StoreDetailsModel storeModels;
    var response = await ApiHandel.getInstance.get('store/$id');
    return response.fold((l) => Left(l), (r) {
      storeModels = StoreDetailsModel.fromJson(r.data['data']);
      return Right(storeModels);
    });
  }

  Future<Either<DioException, bool>> follow(int id) async {
    StoreDetailsModel storeModels;
    var response = await ApiHandel.getInstance.get('user/store/$id/follow');
    return response.fold((l) => Left(l), (r) {
      storeModels = StoreDetailsModel.fromJson(r.data['data']);
      return const Right(true);
    });
  }

  Future<Either<DioException, bool>> unfollow(int id) async {
    StoreDetailsModel storeModels;
    var response = await ApiHandel.getInstance.get('user/store/$id/unfollow');
    return response.fold((l) => Left(l), (r) {
      storeModels = StoreDetailsModel.fromJson(r.data['data']);
      return const Right(true);
    });
  }
}
