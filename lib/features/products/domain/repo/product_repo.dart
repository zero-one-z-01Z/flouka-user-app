import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';

import '../entity/product_review_entity.dart';

abstract class ProductRepo {
  // User Products
  Future<Either<DioException, List<ProductEntity>>> getFeatures();
  Future<Either<DioException, List<ProductEntity>>> getFeatureProducts(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, List<ProductEntity>>> getRecommended(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, List<ProductEntity>>> getSuggestedProducts(
    Map<String, dynamic> data,
  );

  Future<Either<DioException, List<ProductEntity>>> getProducts(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, ProductEntity>> getProductDetails(
    Map<String, dynamic> data,
  );

  // Maeket Products
  Future<Either<DioException, List<ProductReviewEntity>>> getProductReviews(
    Map<String, dynamic> data,
  );

  // Favorite
  Future<Either<DioException, List<ProductEntity>>> getFavorites(Map<String, dynamic> data);
  Future<Either<DioException, bool>> updateFavorite(Map<String, dynamic> data);
  Future<Either<DioException, bool>> createReview(Map<String, dynamic> data);
}
