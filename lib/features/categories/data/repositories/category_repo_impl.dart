import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../datasource/category_remote_date_source.dart';
import '../../domain/entity/category_entity.dart';
import '../../domain/repositories/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepoImpl(this.categoryRemoteDataSource);

  @override
  Future<Either<DioException, List<CategoryEntity>>> getCategories(Map<String, dynamic> data) async {
    return await categoryRemoteDataSource.getCategories(data);
  }
}
