import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/categories/data/model/category_model.dart';
import '../datasource/category_remote_data_source.dart';
import '../../domain/repositories/category_repo.dart';
import '../model/popular_categories_model.dart';

class CategoryRepoImpl implements CategoryRepo {
  final CategoryRemoteDataSource categoryRemoteDataSource;

  CategoryRepoImpl(this.categoryRemoteDataSource);

  @override
  Future<Either<DioException, List<CategoryModel>>> getCategories() async {
    return await categoryRemoteDataSource.getCategories();
  }

  @override
  Future<Either<DioException, List<PopularCategoriesModel>>> popularCategories() async {
    return await categoryRemoteDataSource.popularCategories();
  }

  @override
  Future<Either<DioException, List<CategoryModel>>> getMainCategories() async {
    return await categoryRemoteDataSource.getMainCategories();
  }
}
