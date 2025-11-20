import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../entity/product_entity.dart';
import '../repo/product_repo.dart';

class ProductUseCase {
  final ProductRepo productRepo;

  ProductUseCase(this.productRepo);

  Future<Either<DioException, ProductEntity>> createProduct(
    Map<String, dynamic> data,
  ) async {
    return await productRepo.createProduct(data);
  }

  Future<Either<DioException, bool>> deleteProduct(
    Map<String, dynamic> data,
  ) async {
    return await productRepo.deleteProduct(data);
  }

  Future<Either<DioException, List<ProductEntity>>> getFeatureProducts(
    Map<String, dynamic> data,
  ) async {
    return await productRepo.getFeatureProducts(data);
  }

  Future<Either<DioException, List<ProductEntity>>> getFeatures() async {
    return await productRepo.getProducts({});
  }

  Future<Either<DioException, ProductEntity>> getMarketProductDetails(
    Map<String, dynamic> data,
  ) async {
    return await productRepo.getMarketProductDetails(data);
  }

  Future<Either<DioException, List<ProductEntity>>> getMarketProducts(
    Map<String, dynamic> data,
  ) async {
    return await productRepo.getMarketProducts(data);
  }

  Future<Either<DioException, ProductEntity>> getProductDetails(
    Map<String, dynamic> data,
  ) async {
    return await productRepo.getProductDetails(data);
  }

  Future<Either<DioException, List<ProductEntity>>> getProducts(
    Map<String, dynamic> data,
  ) async {
    return await productRepo.getProducts(data);
  }

  Future<Either<DioException, ProductEntity>> updateProduct(
    Map<String, dynamic> data,
  ) async {
    return await productRepo.updateProduct(data);
  }
}
