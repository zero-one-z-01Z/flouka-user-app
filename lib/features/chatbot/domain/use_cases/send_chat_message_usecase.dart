import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../entities/chat_message.dart';
import '../repositories/chat_repository.dart';

class SendAiMessageUseCase {
  final ChatBotRepository repository;

  SendAiMessageUseCase(this.repository);

  Future<Either<DioException, dynamic>> aiChat(Map<String, dynamic> data) async{
    return await repository.aiChat(data);
  }
}
