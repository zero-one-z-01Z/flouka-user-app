import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/helper_function/api.dart';
import '../models/story_model.dart';

class StoryRemoteDataSource {
  final ApiHandel apiHandel;

  StoryRemoteDataSource(this.apiHandel);

  Future<Either<DioException, List<StoryModel>>> getStories() async {
    var response = await apiHandel.get('stories');
    return response.fold((l) => Left(l), (r) {
      List<StoryModel> list = [];
      for (var i in r.data['data']) {
        list.add(StoryModel.fromJson(i));
      }
      return Right(list);
    });
  }
}
