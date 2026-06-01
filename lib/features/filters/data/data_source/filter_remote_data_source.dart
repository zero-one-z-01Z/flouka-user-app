import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/helper_function/api.dart';
import 'package:flouka/features/filters/data/models/filter_model.dart';
import 'package:flouka/features/filters/domain/entity/filter_entity.dart';
import 'package:flouka/features/products/data/models/product_model.dart';

import '../models/brand_model.dart';
import '../models/category_attributes_model.dart';

class FilterRemoteDataSource {
  final ApiHandel apiHandel;
  FilterRemoteDataSource( this.apiHandel);
  Future<Either<DioException, List<FilterEntity>>> getFilters() async {
    List<FilterModel> filterModels = [];
    var response = await apiHandel.get('filters');
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        filterModels.add(FilterModel.fromJson(i));
      }
      return Right(filterModels);
    });
  }

  Future<Either<DioException, List<ProductModel>>> getFilteredProducts(
    int id,
  ) async {
    List<ProductModel> productModels = [];
    var response = await apiHandel.get('filters/products/$id');
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        productModels.add(ProductModel.fromJson(i));
      }
      return Right(productModels);
    });
  }

  Future<Either<DioException, List<BrandModel>>> getCategoryBrands(Map<String,dynamic> data) async {
    List<BrandModel> filterModels = [];
    var response = await apiHandel.post('get_brands',data);
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        filterModels.add(BrandModel.fromJson(i));
      }
      return Right(filterModels);
    });
  }


  Future<Either<DioException, List<CategoryAttributesModel>>> getCategoryAttributes(Map<String,dynamic> data) async {
    List<CategoryAttributesModel> filterModels = [];
    var response = await apiHandel.post('get_attributes',data);
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        filterModels.add(CategoryAttributesModel.fromJson(i));
      }
      return Right(filterModels);
    });
  }
}
