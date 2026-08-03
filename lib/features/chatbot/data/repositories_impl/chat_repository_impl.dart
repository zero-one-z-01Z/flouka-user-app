

import 'package:dartz/dartz.dart';

import 'package:dio/src/dio_exception.dart';

import '../../domain/entities/chat_message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../data_sources/chat_remote_datasource.dart';

class ChatBotRepositoryImpl implements ChatBotRepository {
  final ChatAiRemoteDatasource remoteDataSource;

  ChatBotRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<DioException, dynamic>> aiChat(Map<String, dynamic> data) async{
    return await remoteDataSource.aiChat(data);
  }


}
