import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/filters/domain/entity/filter_entity.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';

abstract class FilterRepo {
  Future<Either<DioException, List<FilterEntity>>> getFilters();
  Future<Either<DioException, List<ProductEntity>>> getFilteredProducts(int id);
}
