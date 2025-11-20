import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/helper_function/api.dart';
import '../models/operation_model.dart';

class WalletRemoteDataSource {
  final ApiHandel apiHandel;
  WalletRemoteDataSource(this.apiHandel);

  Future<Either<DioException, List<OperationModel>>> walletOperations(Map<String, dynamic> data) async {
    var response = await apiHandel.get('user/get_wallet_operations', data);

    return response.fold((l) => Left(l), (r) {
      List<OperationModel> list = [];
      for (var element in r.data['data']) {
        list.add(OperationModel.fromJson(element));
      }
      return Right(list);
    });
  }
}
