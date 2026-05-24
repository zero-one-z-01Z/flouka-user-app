import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/filters/domain/entity/filter_entity.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';

import '../entity/brand_entity.dart';
import '../entity/category_attributes_entity.dart';

abstract class FilterRepo {
  Future<Either<DioException, List<FilterEntity>>> getFilters();
  Future<Either<DioException, List<ProductEntity>>> getFilteredProducts(int id);
  Future<Either<DioException, List<BrandEntity>>> getCategoryBrands(Map<String,dynamic> data);
  Future<Either<DioException, List<CategoryAttributesEntity>>> getCategoryAttributes(Map<String,dynamic> data);
}
