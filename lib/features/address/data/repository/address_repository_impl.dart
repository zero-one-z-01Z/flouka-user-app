import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/address/data/datasource/address_remote_data_source.dart';
import 'package:flouka/features/address/domain/repository/address_repository.dart';
import '../../domain/entities/address_entity.dart';

class AddressRepoImpl implements AddressRepo {
  final AddressRemoteDataSource addressRemoteDataSource;

  AddressRepoImpl(this.addressRemoteDataSource);

  @override
  Future<Either<DioException, AddressEntity>> createAddress(
    Map<String, dynamic> data,
  ) async {
    return addressRemoteDataSource.createAddress(data);
  }

  @override
  Future<Either<DioException, bool>> deleteAddress(
    Map<String, dynamic> data,
  ) async {
    return addressRemoteDataSource.deleteAddress(data);
  }

  @override
  Future<Either<DioException, List<AddressEntity>>> getAddress(
    Map<String, dynamic> data,
  ) async {
    return addressRemoteDataSource.getAddress(data);
  }

  @override
  Future<Either<DioException, AddressEntity>> updateAddress(
    Map<String, dynamic> data,
  ) async {
    return addressRemoteDataSource.updateAddress(data);
  }
}
