import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../data/data_sources/remote.dart';
import '../../data/repositories/wallet_repo.dart';
import '../../data/models/operation_model.dart';

class WalletRepoImpl implements WalletRepo {

  final WalletRemoteDataSource walletRemoteDataSource;

  WalletRepoImpl(this.walletRemoteDataSource);

  @override
  Future<Either<DioException, List<OperationModel>>> walletOperations(
      Map<String, dynamic> data) async {
    return await walletRemoteDataSource.walletOperations(data);
  }

}
