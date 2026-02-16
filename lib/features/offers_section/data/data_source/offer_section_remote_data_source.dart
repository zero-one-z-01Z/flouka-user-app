import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/helper_function/api.dart';
import 'package:flouka/features/offers_section/data/models/offer_secrion_model.dart';

class OfferSectionRemoteDataSource {
  final ApiHandel apiHandel;
  OfferSectionRemoteDataSource(this.apiHandel);
  Future<Either<DioException, List<OfferSectionModel>>> getOfferSections() async {
    List<OfferSectionModel> offerSectionModels = [];
    var response = await ApiHandel.getInstance.get('sections');
    return response.fold((l) => Left(l), (r) {
      for (var i in r.data['data']) {
        offerSectionModels.add(OfferSectionModel.fromJson(i));
      }
      return Right(offerSectionModels);
    });
  }
}
