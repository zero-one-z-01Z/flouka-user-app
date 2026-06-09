import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/repo/product_repo.dart';
import '../data_source/product_remote_data_source.dart';
import '../models/product_model.dart';
import '../models/product_review_model.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepoImpl(this.productRemoteDataSource);

  @override
  Future<Either<DioException, List<ProductModel>>> getFeatureProducts(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.getFeatureProducts(data);
  }


  @override
  Future<Either<DioException, List<ProductModel>>> getSuggestedProducts(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.getSuggestedProducts(data);
  }



  @override
  Future<Either<DioException, List<ProductModel>>> getRecommended(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.getRecommended(data);
  }

  // @override
  // Future<Either<DioException, List<FeatureEntity>>> getFeatures() async {
  //   return await productRemoteDataSource.getFeatures();
  // }


  @override
  Future<Either<DioException, List<ProductReviewModel>>> getProductReviews(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.getProductReviews(data);
  }

  @override
  Future<Either<DioException, ProductModel>> getProductDetails(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.getProductDetails(data);
  }

  @override
  Future<Either<DioException, List<ProductModel>>> getProducts(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.getProducts(data);
  }


  @override
  Future<Either<DioException, List<ProductModel>>> getFeatures() {
    throw UnimplementedError();
  }

  @override
  Future<Either<DioException, bool>> createReview(Map<String, dynamic> data,) async {
    return await productRemoteDataSource.createReview(data);
  }

  @override
  Future<Either<DioException, bool>> updateFavorite(
      Map<String, dynamic> data,
      ) async {
    return await productRemoteDataSource.updateFavorite(data);
  }

  @override
  Future<Either<DioException, List<ProductModel>>> getFavorites(Map<String, dynamic> data) async {
    return await productRemoteDataSource.getFavorites(data);
  }

}
