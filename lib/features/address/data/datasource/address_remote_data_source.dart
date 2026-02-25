import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/helper_function/api.dart';
import '../model/address_model.dart';
import '../model/city_model.dart';

class AddressRemoteDataSource {
  final ApiHandel apiHandel;
  AddressRemoteDataSource(this.apiHandel);

  Future<Either<DioException, List<AddressModel>>> getAddress() async {
    var response = await apiHandel.get('user/addresses');
    return response.fold((l) => Left(l), (r) {
      List<AddressModel> list = [];
      for (var i in r.data['data']) {
        list.add(AddressModel.fromJson(i));
      }
      return Right(list);
    });
  }

  Future<Either<DioException, AddressModel>> createAddress(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.post('user/create_address', data);
    return response.fold((l) => Left(l), (r) {
      return Right(AddressModel.fromJson(r.data['data']));
    });
  }

  Future<Either<DioException, AddressModel>> updateAddress(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.post('user/edit_address', data);
    return response.fold((l) => Left(l), (r) {
      return Right(AddressModel.fromJson(r.data['data']));
    });
  }

  Future<Either<DioException, bool>> deleteAddress(Map<String, dynamic> data) async {
    var response = await apiHandel.delete('user/addresses', data);
    log(response.toString());
    return response.fold((l) => Left(l), (r) {
      return const Right(true);
    });
  }

  Future<Either<DioException, CityModel>> getLatLngCity(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.post('get_lat_lng_city', data);
    return response.fold((l) => Left(l), (r) {
      return Right(CityModel.fromJson(r.data['data']));
    });
  }
}
