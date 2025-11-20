import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/helper_function/api.dart';
import 'package:flouka/features/categories/data/model/category_model.dart';

class CategoryRemoteDataSource {
  final ApiHandel apiHandel;

  CategoryRemoteDataSource(this.apiHandel);

  Future<Either<DioException, List<CategoryModel>>> getCategories() async {
    var response = await apiHandel.get('get_categories', {});
    return response.fold((l) => Left(l), (r) {
      List<CategoryModel> list = [];
      for (var i in r.data['data']) {
        list.add(CategoryModel.fromJson(i));
      }
      return Right(list);
    });
  }
}
