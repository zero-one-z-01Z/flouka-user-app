import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/core/widgets/price_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomRangeSlider extends StatefulWidget {
  const CustomRangeSlider({super.key});

  @override
  State<CustomRangeSlider> createState() => _CustomRangeSliderState();
}

class _CustomRangeSliderState extends State<CustomRangeSlider> {
  RangeValues _currentRangeValues = const RangeValues(0, 20000);
  @override
  Widget build(BuildContext context) {
    // final filterProvider = Provider.of<FilterProductsProvider>(context, listen: false,);
    // final settingsProvider = Provider.of<SettingsProvider>(context, listen: false,);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RangeSlider(
          // values: filterProvider.priceRange,
          values: _currentRangeValues,
          min: 0,
          max: 20000,
          divisions: 100,
          semanticFormatterCallback: (value) => value.round().toString(),
          labels: const RangeLabels(
            // filterProvider.priceRange.start.toStringAsFixed(2),
            // filterProvider.priceRange.end.toStringAsFixed(2),
            "0",
            "20000",
          ),
          activeColor: AppColor.primaryColor,
          inactiveColor: Colors.grey.withOpacity(0.2),
          onChanged: (RangeValues values) {
            setState(() {
              _currentRangeValues = values;

              // filterProvider.priceRange = values;
            });
            // Update filter provider
            // filterProvider.selectPriceRange(values);
          },
        ),
        Row(
          children: [
            PriceWidget(
              price: _currentRangeValues.start.ceil(),
              fontSize: 16.sp,
            ),
            const Spacer(),
            PriceWidget(price: _currentRangeValues.end.ceil(), fontSize: 16.sp),
          ],
        ),
      ],
    );
  }
}
