import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/offers_section/domain/entity/offer_section_entity.dart';
import 'package:flouka/features/offers_section/domain/repo/offer_section_repo.dart';

class OfferSectionUseCase {
  final OfferSectionRepo offerSectionRepo;
  OfferSectionUseCase(this.offerSectionRepo);
  Future<Either<DioException, List<OfferSectionEntity>>> getOfferSections() {
    return offerSectionRepo.getOfferSections();
  }
}