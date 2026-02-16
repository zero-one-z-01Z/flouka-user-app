import 'package:flouka/features/offers_section/domain/entity/offer_section_entity.dart';
import 'package:flouka/features/offers_section/domain/use_case/offer_section_usecase.dart';
import 'package:flutter/material.dart';

class OfferSectionProvider extends ChangeNotifier {
  final OfferSectionUseCase offerSectionUseCase;
  OfferSectionProvider(this.offerSectionUseCase);
  List<OfferSectionEntity>? data;

  Future<void> getData() async {
    var response = await offerSectionUseCase.getOfferSections();
    response.fold((l) {
      data = [];
    }, (r) {
      data = r;
    });
  }
}
