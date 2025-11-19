import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../domain/entity/product_entity.dart';
import '../../domain/repo/product_repo.dart';
import '../data_source/product_remote_data_source.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductRemoteDataSource productRemoteDataSource;

  ProductRepoImpl(this.productRemoteDataSource);

  @override
  Future<Either<DioException, ProductEntity>> createProduct(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.createProduct(data);
  }

  @override
  Future<Either<DioException, bool>> deleteProduct(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.deleteProduct(data);
  }

  @override
  Future<Either<DioException, List<ProductEntity>>> getFeatureProducts(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.getFeatureProducts(data);
  }

  // @override
  // Future<Either<DioException, List<FeatureEntity>>> getFeatures() async {
  //   return await productRemoteDataSource.getFeatures();
  // }

  @override
  Future<Either<DioException, ProductEntity>> getMarketProductDetails(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.getMarketProductDetails(data);
  }

  @override
  Future<Either<DioException, List<ProductEntity>>> getMarketProducts(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.getMarketProducts(data);
  }

  @override
  Future<Either<DioException, ProductEntity>> getProductDetails(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.getProductDetails(data);
  }

  @override
  Future<Either<DioException, List<ProductEntity>>> getProducts(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.getProducts(data);
  }

  @override
  Future<Either<DioException, ProductEntity>> updateProduct(
    Map<String, dynamic> data,
  ) async {
    return await productRemoteDataSource.updateProduct(data);
  }

  @override
  Future<Either<DioException, List<ProductEntity>>> getFeatures() {
    throw UnimplementedError();
  }
}
