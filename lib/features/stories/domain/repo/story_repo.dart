import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/stories/domain/entity/story_entity.dart';

abstract class StoryRepo {
  Future<Either<DioException, List<StoryEntity>>> getStories();
}
