import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/address_entity.dart';
import '../../domain/repository/address_repository.dart';
import '../datasource/address_remote_data_source.dart';

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
  Future<Either<DioException, bool>> deleteAddress(Map<String, dynamic> data) async {
    return addressRemoteDataSource.deleteAddress(data);
  }

  @override
  Future<Either<DioException, List<AddressEntity>>> getAddress() async {
    return addressRemoteDataSource.getAddress();
  }

  @override
  Future<Either<DioException, AddressEntity>> updateAddress(
    Map<String, dynamic> data,
  ) async {
    return addressRemoteDataSource.updateAddress(data);
  }
}
