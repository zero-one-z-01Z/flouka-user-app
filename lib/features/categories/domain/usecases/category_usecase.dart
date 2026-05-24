import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../entity/category_entity.dart';
import '../entity/popular_categories_entity.dart';
import '../repositories/category_repo.dart';

class CategoryUsecase {
  final CategoryRepo categoryRepo;
  CategoryUsecase(this.categoryRepo);

  Future<Either<DioException, List<CategoryEntity>>> getCategories() async {
    return await categoryRepo.getCategories();
  }

  Future<Either<DioException, List<PopularCategoriesEntity>>> popularCategories() async {
    return await categoryRepo.popularCategories();
  }

  Future<Either<DioException, List<CategoryEntity>>> getMainCategories() async {
    return await categoryRepo.getMainCategories();
  }
}
