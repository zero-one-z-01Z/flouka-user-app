

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class ChatBotRepository {
  Future<Either<DioException, dynamic>> aiChat(Map<String, dynamic> data,);
}
