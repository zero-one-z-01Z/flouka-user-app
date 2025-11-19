import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';

abstract class ProductRepo {
  // User Products
  Future<Either<DioException, List<ProductEntity>>> getFeatures();
  Future<Either<DioException, List<ProductEntity>>> getFeatureProducts(
    Map<String, dynamic> data,
  );

  Future<Either<DioException, List<ProductEntity>>> getProducts(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, ProductEntity>> getProductDetails(
    Map<String, dynamic> data,
  );

  // Maeket Products
  Future<Either<DioException, List<ProductEntity>>> getMarketProducts(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, ProductEntity>> getMarketProductDetails(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, ProductEntity>> createProduct(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, ProductEntity>> updateProduct(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, bool>> deleteProduct(Map<String, dynamic> data);
}
