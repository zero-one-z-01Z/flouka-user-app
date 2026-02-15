import 'package:dartz/dartz.dart';
import 'package:dio/src/dio_exception.dart';
import 'package:flouka/features/filters/domain/entity/filter_entity.dart';
import 'package:flouka/features/filters/domain/repo/filter_repo.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';

class FilterUseCase {
  final FilterRepo filterRepo;
  FilterUseCase(this.filterRepo);
  Future<Either<DioException, List<FilterEntity>>> getFilters() {
    return filterRepo.getFilters();
  }

  Future<Either<DioException, List<ProductEntity>>> getFiltersProducts(int id) {
    return filterRepo.getFilteredProducts(id);
  }
}
