import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/helper_function/api.dart';


class ChatAiRemoteDatasource {
  final ApiHandel apiHandel;
  ChatAiRemoteDatasource(this.apiHandel);

  Future<Either<DioException, dynamic>> aiChat(
      Map<String, dynamic> data,
      ) async {
    var response = await apiHandel.post('ai-chat', data);

    return response.fold(
          (l) {
        return Left(l);
      },
          (r) {

        return Right(r.data['data']);
      },
    );
  }
}
