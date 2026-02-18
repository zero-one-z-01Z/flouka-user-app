import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/stories/domain/entity/story_entity.dart';
import 'package:flouka/features/stories/domain/repo/story_repo.dart';

class StoryUseCase {
  final StoryRepo storyRepo;

  StoryUseCase(this.storyRepo);
  Future<Either<DioException, List<StoryEntity>>> getStories() {
    return storyRepo.getStories();
  }
}
