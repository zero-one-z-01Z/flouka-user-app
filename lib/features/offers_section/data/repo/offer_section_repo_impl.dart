import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/offers_section/data/data_source/offer_section_remote_data_source.dart';
import 'package:flouka/features/offers_section/domain/entity/offer_section_entity.dart';
import 'package:flouka/features/offers_section/domain/repo/offer_section_repo.dart';

class OfferSectionRepoImpl implements OfferSectionRepo {
  final OfferSectionRemoteDataSource offerSectionRemoteDataSource;
  OfferSectionRepoImpl(this.offerSectionRemoteDataSource);
  @override
  Future<Either<DioException, List<OfferSectionEntity>>> getOfferSections() {
    return offerSectionRemoteDataSource.getOfferSections();
  }
}
