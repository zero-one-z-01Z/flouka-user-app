import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/entity/category_entity.dart';
import '../entity/popular_categories_entity.dart';

abstract class CategoryRepo {
  Future<Either<DioException, List<CategoryEntity>>> getCategories();
  Future<Either<DioException, List<PopularCategoriesEntity>>> popularCategories();
  Future<Either<DioException, List<CategoryEntity>>> getMainCategories();
}
