import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/reels/domain/entity/reel_entity.dart';
import 'package:flouka/features/reels/domain/repo/reel_repo.dart';

class ReelUseCase {
  final ReelRepo reelRepo;
  ReelUseCase(this.reelRepo);

  Future<Either<DioException, List<ReelEntity>>> getReels() {
    return reelRepo.getReels();
  }
}
