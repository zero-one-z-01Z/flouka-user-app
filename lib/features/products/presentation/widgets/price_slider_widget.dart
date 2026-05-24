import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/config/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/search_filter_provider.dart';

class PriceSliderWidget extends StatefulWidget {
  const PriceSliderWidget({super.key});

  @override
  State<PriceSliderWidget> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<PriceSliderWidget> {

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<SearchFilterProvider>(context, listen: false,);
    Map<String,dynamic> element= filterProvider.mainFilters.firstWhere((e) => e['title'] == 'price');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RangeSlider(
          values: filterProvider.priceRange,
          min: 0,
          max: 20000,
          divisions: 100,
          labels: RangeLabels(
            filterProvider.priceRange.start.toStringAsFixed(2),
            filterProvider.priceRange.end.toStringAsFixed(2),
          ),
          activeColor: AppColor.primaryColor,
          inactiveColor: Colors.grey.shade400,
          onChanged: (RangeValues values) {
            setState(() {
              filterProvider.priceRange = values;
            });
            // Update filter provider
            filterProvider.selectPriceRange(values);
          },
        ),
      ],
    );
  }
}