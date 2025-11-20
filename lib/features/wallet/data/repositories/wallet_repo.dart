import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../domain/entities/operation_entity.dart';

abstract class WalletRepo{
  Future<Either<DioException,List<OperationEntity>>> walletOperations(Map<String, dynamic> data);
}