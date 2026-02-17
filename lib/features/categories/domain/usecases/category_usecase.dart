import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../entity/category_entity.dart';
import '../repositories/category_repo.dart';

class CategoryUsecase {
  final CategoryRepo categoryRepo;
  CategoryUsecase(this.categoryRepo);
  Future<Either<DioException, List<CategoryEntity>>> getCategories(Map<String, dynamic> data) async {
    return await categoryRepo.getCategories(data);
  }
}
