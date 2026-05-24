import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/helper_function/api.dart';
import '../model/banners_model.dart';

class BannersRemoteDataSource {
  final ApiHandel apiHandel;
  BannersRemoteDataSource(this.apiHandel);

  Future<Either<DioException, List<BannersModel>>> getBanners(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.get('get_banners', data);

    return response.fold(
      (l) {
        return Left(l);
      },
      (r) {
        List<BannersModel> bannersModel = [];
        for (var i in r.data['data']) {
          bannersModel.add(BannersModel.fromJson(i));
        }
        return Right(bannersModel);
      },
    );
  }
}
