import 'package:flouka/core/widgets/checkbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/widgets/radio_widget.dart';
import '../providers/search_filter_provider.dart';
import 'price_slider_widget.dart';

class FilterChildrenWidget extends StatelessWidget {
  const FilterChildrenWidget({super.key,required this.data});
  final Map<String,dynamic> data;
  @override
  Widget build(BuildContext context) {
    final SearchFilterProvider provider = Provider.of(Constants.globalContext(),);
    return Builder(builder: (context) {
      if(data['children']!=null){
        return Column(
          children: List.generate(data['children'].length, (index){
            return Row(
              children: [
                Expanded(child: Text(data['children'][index]['name'],style: TextStyleClass.normalStyle(),maxLines: 1,
                  overflow: TextOverflow.ellipsis,)),
                CheckBoxWidget(check: data['children'][index]['active']??false, onChange: (val){
                  provider.setLabelValue(data, data['children'][index]);
                }),

              ],
            );
          },),
        );
      }else if(data['title']=="price"){
        return const PriceSliderWidget();
      }else{
        return const SizedBox();
      }
    },);
  }
}
