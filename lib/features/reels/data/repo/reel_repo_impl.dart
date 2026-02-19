import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/entity/reel_entity.dart';
import '../../domain/repo/reel_repo.dart';
import '../data_source/reel_remote_data_source.dart';

class ReelRepoImpl implements ReelRepo {
  final ReelRemoteDataSource reelRemoteDataSource;

  ReelRepoImpl(this.reelRemoteDataSource);

  @override
  Future<Either<DioException, List<ReelEntity>>> getReels() {
    return reelRemoteDataSource.getReels();
  }
}
