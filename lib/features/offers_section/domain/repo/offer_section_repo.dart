import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/offers_section/domain/entity/offer_section_entity.dart';

abstract class OfferSectionRepo {
  Future<Either<DioException, List<OfferSectionEntity>>> getOfferSections();
} 