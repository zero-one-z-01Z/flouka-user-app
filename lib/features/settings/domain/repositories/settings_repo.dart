import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../entities/common_question_entity.dart';
import '../entities/insurance_entity.dart';
import '../entities/know_us_entity.dart';
import '../entities/settings_entity.dart';

abstract class SettingsRepo {
  Future<Either<DioException,bool>> contactUs(Map<String,dynamic> data);
  Future<Either<DioException,SettingsEntity>> getSettings();
  Future<Either<DioException, List<CommonQuestionEntity>>> getFaqCategories();
  Future<Either<DioException, List<KnowUsEntity>>> getHowKnowUs();
  Future<Either<DioException, List<InsuranceEntity>>> getInsurances(Map<String, dynamic> data);
}
