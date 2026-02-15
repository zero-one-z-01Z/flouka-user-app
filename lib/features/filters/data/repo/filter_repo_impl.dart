import 'package:dartz/dartz.dart';
import 'package:dio/src/dio_exception.dart';
import 'package:flouka/features/filters/data/data_source/filter_remote_data_source.dart';
import 'package:flouka/features/filters/domain/entity/filter_entity.dart';
import 'package:flouka/features/filters/domain/repo/filter_repo.dart';
import 'package:flouka/features/products/data/models/product_model.dart';

class FilterRepoImpl implements FilterRepo {
  final FilterRemoteDataSource filterRemoteDataSource;
  FilterRepoImpl( this.filterRemoteDataSource);
  @override
  Future<Either<DioException, List<FilterEntity>>> getFilters() {
    return filterRemoteDataSource.getFilters();
  }

  @override
  Future<Either<DioException, List<ProductModel>>> getFilteredProducts(
    int id,
  ) {
    return filterRemoteDataSource.getFilteredProducts(id);
  }
}