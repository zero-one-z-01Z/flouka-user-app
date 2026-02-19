import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/reels/domain/entity/reel_entity.dart';

abstract class ReelRepo {
  Future<Either<DioException, List<ReelEntity>>> getReels();
}

