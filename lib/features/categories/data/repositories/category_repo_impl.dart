import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../data/datasource/remote.dart';
import '../../domain/entity/category_entity.dart';
import '../../domain/repositories/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepoImpl(this.categoryRemoteDataSource);

  @override
  Future<Either<DioException, List<CategoryEntity>>> getCategories() async {
    return await categoryRemoteDataSource.getCategories();
  }
}
