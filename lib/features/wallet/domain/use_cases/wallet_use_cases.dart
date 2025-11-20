import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../data/repositories/wallet_repo.dart';
import '../entities/operation_entity.dart';

class WalletUseCases {
  WalletRepo userRepo;
  WalletUseCases(this.userRepo);

  Future<Either<DioException, List<OperationEntity>>> walletOperations(Map<String, dynamic> data) async{
    return await  userRepo.walletOperations(data);
  }

}