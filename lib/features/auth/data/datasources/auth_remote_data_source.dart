import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/auth/data/models/user_model.dart';
import 'package:flouka/features/auth/domain/entities/user_entity.dart';

import '../../../../core/helper_function/api.dart';

class AuthRemoteDataSource {
  final ApiHandel apiHandel;
  AuthRemoteDataSource(this.apiHandel);

  Future<Either<DioException, UserModel>> socialLogin(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.post('user/social_login', data);
    return response.fold(
      (l) => Left(l),
      (r) => Right(UserModel.fromJson(r.data['data'])),
    );
  }

  Future<Either<DioException, UserModel>> getProfile() async {
    var response = await apiHandel.get('user/get-profile');
    return response.fold(
      (l) => Left(l),
      (r) => Right(UserModel.fromJson(r.data['data'])),
    );
  }

  Future<Either<DioException, String>> logout(Map<String, dynamic> data) async {
    var response = await apiHandel.post('user/logout', data);
    return response.fold((l) => Left(l), (r) => Right(r.data['data']));
  }

  Future<Either<DioException, String>> deleteAccount() async {
    var response = await apiHandel.post('user/delete_account', {});
    return response.fold((l) => Left(l), (r) => Right(r.data['data']));
  }

  Future<Either<DioException, UserModel>> updateProfile(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.post('user/update_profile', data);
    return response.fold(
      (l) => Left(l),
      (r) => Right(UserModel.fromJson(r.data['data'])),
    );
  }

  Future<Either<DioException, String>> refreshToken(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.post('user/refresh-token', data);
    return response.fold((l) => Left(l), (r) => Right(r.data['data']['token']));
  }

  Future<Either<DioException, UserEntity>> checkCode(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.post('user/check-code', data);
    return response.fold(
      (l) => Left(l),
      (r) => Right(UserModel.fromJson(r.data['data'])),
    );
  }

  Future<Either<DioException, bool>> sendOtp(Map<String, dynamic> data) async {
    var response = await apiHandel.post('user/send-otp', data);
    return response.fold((l) => Left(l), (r) => const Right(true));
  }

  Future<Either<DioException, UserEntity>> login(Map<String, dynamic> data) async {
    var response = await apiHandel.post('user/login', data);
    return response.fold(
      (l) => Left(l),
      (r) => Right(UserModel.fromJson(r.data['data'])),
    );
  }
}
