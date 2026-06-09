import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/helper_function/api.dart';
import 'package:flouka/features/products/data/models/product_review_model.dart';

import '../models/product_model.dart';

  class ProductRemoteDataSource {
  final ApiHandel apiHandel;
  ProductRemoteDataSource(this.apiHandel);
  // user products
  // Future<Either<DioException, List<FeatureEntity>>> getFeatures() async {
  //   List<FeatureModel> featureModels = [];
  //   var response = await ApiHandel.getInstance.get('get_features');
  //   return response.fold((l) => Left(l), (r) {
  //     for (var i in r.data['data']) {
  //       featureModels.add(FeatureModel.fromJson(i));
  //     }
  //     return Right(featureModels);
  //   });
  // }

  Future<Either<DioException, List<ProductModel>>> getFeatureProducts(
    Map<String, dynamic> data,
  ) async {
    var response = await ApiHandel.getInstance.post(
      'get_feature_products',
      data,
    );
    List<ProductModel> productModels = [];
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        productModels.add(ProductModel.fromJson(i));
      }
      return Right(productModels);
    });
  }

  Future<Either<DioException, List<ProductModel>>> getSuggestedProducts(
    Map<String, dynamic> data,
  ) async {
    var response = await ApiHandel.getInstance.post(
      'get_suggested_products',
      data,
    );
    List<ProductModel> productModels = [];
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        productModels.add(ProductModel.fromJson(i));
      }
      return Right(productModels);
    });
  }



  Future<Either<DioException, List<ProductModel>>> getProducts(
    Map<String, dynamic> data,
  ) async {
    var response = await ApiHandel.getInstance.post('get_products', data);
    List<ProductModel> productModels = [];
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        productModels.add(ProductModel.fromJson(i));
      }
      return Right(productModels);
    });
  }

  Future<Either<DioException, List<ProductModel>>> getFavorites(
      Map<String, dynamic> data,
      ) async {
    var response = await ApiHandel.getInstance.post('user/get_favorite_products', data);
    List<ProductModel> productModels = [];
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        productModels.add(ProductModel.fromJson(i));
      }
      return Right(productModels);
    });
  }

  Future<Either<DioException, bool>> updateFavorite(Map<String, dynamic> data,) async {
    var response = await ApiHandel.getInstance.post('user/update_favorite', data);
    return response.fold((l) => Left(l), (r) {
      return const Right(true);
    });
  }

  Future<Either<DioException, List<ProductModel>>> getRecommended(
    Map<String, dynamic> data,
  ) async {
    var response = await ApiHandel.getInstance.post('get_recommended_products', data);
    List<ProductModel> productModels = [];
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        productModels.add(ProductModel.fromJson(i));
      }
      return Right(productModels);
    });
  }

  Future<Either<DioException, ProductModel>> getProductDetails(
    Map<String, dynamic> data,
  ) async {
    var response = await ApiHandel.getInstance.post('get_product_details', data,);
    return response.fold((l) {
      return Left(l);
    }, (r) {
      return Right(ProductModel.fromJson(r.data['data']));
    });
  }

  Future<Either<DioException, List<ProductReviewModel>>> getProductReviews(
    Map<String, dynamic> data,
  ) async {
    var response = await ApiHandel.getInstance.post('get_product_reviews', data,);
    List<ProductReviewModel> productModels = [];
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        productModels.add(ProductReviewModel.fromJson(i));
      }
      return Right(productModels);
    });
  }

  Future<Either<DioException, bool>> createReview(Map<String, dynamic> data,) async {
    var response = await ApiHandel.getInstance.post('user/create_review', data,);
    return response.fold((l) => Left(l), (r) {
      return const Right(true);
    });
  }
}
