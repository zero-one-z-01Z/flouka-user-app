import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/banner_entity.dart';
import '../../domain/repositories/banner_repository.dart';
import '../datasource/banners_remote_data_source.dart';

class BannersRepoImpl implements BannersRepository {
  final BannersRemoteDataSource bannersRemoteDataSource;

  BannersRepoImpl(this.bannersRemoteDataSource);

  @override
  Future<Either<DioException, List<BannersEntity>>> getBanners(
    Map<String, dynamic> data,
  ) async {
    return await bannersRemoteDataSource.getBanners(data);
  }
}
