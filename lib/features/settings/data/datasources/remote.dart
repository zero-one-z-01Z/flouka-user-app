import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../../core/helper_function/api.dart';
import '../models/common_question_model.dart';
import '../models/insurance_model.dart';
import '../models/know_us_model.dart';
import '../models/settings_model.dart';

class SettingsRemoteDataSource {
  final ApiHandel apiHandel;
  SettingsRemoteDataSource(this.apiHandel);

  Future<Either<DioException, bool>> contactUs(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.post('contact_us', data);
    return response.fold((l) => Left(l), (r) {
      return const Right(true);
    });
  }

  Future<Either<DioException, SettingsModel>> getSettings() async {
    var response = await apiHandel.get('get_settings');
    SettingsModel settingsModel;
    return response.fold((l) => Left(l), (r) {
      settingsModel = SettingsModel.fromJson(r.data['data']);
      return Right(settingsModel);
    });
  }

  Future<Either<DioException, List<CommonQuestionModel>>>
  getFaqCategories() async {
    var response = await apiHandel.get('faq_categories');
    return response.fold((l) => Left(l), (r) {
      List<CommonQuestionModel> list = [];
      for (var item in r.data['data']) {
        list.add(CommonQuestionModel.fromJson(item));
      }
      return Right(list);
    });
  }

  Future<Either<DioException, List<KnowUsModel>>> getHowKnowUs() async {
    var response = await apiHandel.get('get_how_know_us');
    return response.fold((l) => Left(l), (r) {
      List<KnowUsModel> list = [];
      for (var item in r.data['data']) {
        list.add(KnowUsModel.fromJson(item));
      }
      return Right(list);
    });
  }

  Future<Either<DioException, List<InsuranceModel>>> getInsurances(
    Map<String, dynamic> data,
  ) async {
    var response = await apiHandel.get('get_insurances', data);
    return response.fold((l) => Left(l), (r) {
      List<InsuranceModel> list = [];
      for (var element in r.data['data']) {
        list.add(InsuranceModel.fromJson(element));
      }
      return Right(list);
    });
  }
}
