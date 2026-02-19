import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/helper_function/api.dart';
import 'package:flouka/features/reels/data/models/reel_model.dart';

class ReelRemoteDataSource {
  final ApiHandel apiHandel;

  ReelRemoteDataSource(this.apiHandel);

  Future<Either<DioException, List<ReelModel>>> getReels() async {
    var response = await apiHandel.get('reels');
    return response.fold((l) => Left(l), (r) {
      List<ReelModel> reelsList = [];
      for (var i in r.data['data']) {
        reelsList.add(ReelModel.fromJson(i));
      }
      return Right(reelsList);
    });
  }
}
