import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/entity/category_entity.dart';

abstract class CategoryRepo {
  Future<Either<DioException, List<CategoryEntity>>> getCategories(Map<String, dynamic> data);
}
