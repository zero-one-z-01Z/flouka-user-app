import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../entities/address_entity.dart';

abstract class AddressRepo {
  Future<Either<DioException, List<AddressEntity>>> getAddress(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, AddressEntity>> createAddress(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, AddressEntity>> updateAddress(
    Map<String, dynamic> data,
  );
  Future<Either<DioException, bool>> deleteAddress(Map<String, dynamic> data);
}
