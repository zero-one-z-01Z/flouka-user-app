import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/address/domain/repository/address_repository.dart';
import '../entities/address_entity.dart';

class AddressUseCases {
  AddressRepo addressRepo;

  AddressUseCases(this.addressRepo);

  Future<Either<DioException, AddressEntity>> createAddress(
    Map<String, dynamic> data,
  ) async {
    return addressRepo.createAddress(data);
  }

  Future<Either<DioException, bool>> deleteAddress(
    Map<String, dynamic> data,
  ) async {
    return addressRepo.deleteAddress(data);
  }

  Future<Either<DioException, List<AddressEntity>>> getAddress(
    Map<String, dynamic> data,
  ) async {
    return addressRepo.getAddress(data);
  }

  Future<Either<DioException, AddressEntity>> updateAddress(
    Map<String, dynamic> data,
  ) async {
    return addressRepo.updateAddress(data);
  }
}
