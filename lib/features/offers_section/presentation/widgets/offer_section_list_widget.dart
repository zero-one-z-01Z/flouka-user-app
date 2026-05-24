import 'package:flouka/features/offers_section/presentation/providers/offer_section_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../home/presentation/widgets/recommended_section.dart';
import '../../../stores/presentation/widgets/stores_home_section.dart';
import '../../domain/entity/offer_section_entity.dart';
import 'offer_section_widget.dart';

class OfferSectionListWidget extends StatelessWidget {
  const OfferSectionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final OfferSectionProvider offerSectionProvider =
        Provider.of<OfferSectionProvider>(context);
    return Builder(
      builder: (context) {
        if (offerSectionProvider.data == null) {
          return const Center(
            child: SizedBox(),
          );
        }
        List<OfferSectionEntity> offers = offerSectionProvider.data!.where((element) => element.products.isNotEmpty).toList();

        return ListView.separated(shrinkWrap: true,
          physics:const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
          return Column(
            children: [
              OffersSectionWidget(
                offerSectionEntity: offers[index],
              ),
              if(index==0)...[
                const StoresHomeSection(),
                const RecommendedSection(),
              ],
            ],
          );
          },
          itemCount: offers.length,
          separatorBuilder: (context, index) => SizedBox(height: 2.h,),
        );
      }
    );
  }
}
