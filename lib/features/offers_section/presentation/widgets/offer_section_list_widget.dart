import 'package:flouka/features/offers_section/presentation/providers/offer_section_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'offer_section_widget.dart';

class OfferSectionListWidget extends StatelessWidget {
  const OfferSectionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final OfferSectionProvider offerSectionProvider =
        Provider.of<OfferSectionProvider>(context);
    return Column(
      spacing: 4,
      children: List.generate(
        offerSectionProvider.data?.length ?? 0,
        (index) => OffersSectionWidget(
          offerSectionEntity: offerSectionProvider.data![index],
        ),
      ),
    );
  }
}
