import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/stories/domain/entity/story_entity.dart';
import 'package:flouka/features/stories/domain/repo/story_repo.dart';

import '../data_source/story_remote_data_source.dart';

class StoryRepoImpl implements StoryRepo {
  final StoryRemoteDataSource storyRemoteDataSource;

  StoryRepoImpl(this.storyRemoteDataSource);
  @override
  Future<Either<DioException, List<StoryEntity>>> getStories() {
    return storyRemoteDataSource.getStories();
  }
}
