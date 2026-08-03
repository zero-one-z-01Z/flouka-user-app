import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/features/products/presentation/providers/best_products_provider.dart';
import 'package:flouka/features/products/presentation/providers/products_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:marqueer/marqueer.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:marquee/marquee.dart';

import '../../../products/domain/entity/product_entity.dart';

class ListTextWidget extends StatelessWidget {
  ListTextWidget({super.key});
  final _marqueerController = MarqueerController();
  @override
  Widget build(BuildContext context) {

    BestProductsProvider provider = context.watch();
    if(provider.data?.isEmpty??true){
      return const SizedBox.shrink();
    }
    // List<String> listText = provider.data!.map((e)=>e.title??"").toList();
    List<ProductEntity> products = provider.data!;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      margin: EdgeInsets.symmetric(vertical: 2.h),
      decoration:const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffD29AD8), Color(0xffB65AF6),],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 1],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: SingleChildScrollView(
              physics:const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(spacing: 2.w,
                children: List.generate(25, (index) {
                  return Container(
                    width: 15,height: 15,
                    decoration:const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  );
                },),
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          SizedBox(
            height: 3.h,
            // child: Marquee(
            //   text: listText.join(' | '),
            //   style:TextStyleClass.normalStyle(color: Colors.white),
            //   scrollAxis: Axis.horizontal,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   blankSpace: 20.0,
            //   velocity: 100.0,
            //   pauseAfterRound: const Duration(seconds: 1),
            //   startPadding: 10.0,
            //   accelerationDuration:const Duration(seconds: 1),
            //   accelerationCurve: Curves.linear,
            //   decelerationDuration:const Duration(milliseconds: 500),
            //   decelerationCurve: Curves.easeOut,
            // ),
            child: Marqueer(
              controller: _marqueerController,
              pps: 100,
              restartAfterInteractionDuration: Duration(milliseconds: 500),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(products.length, (index){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: InkWell(
                      onTap: () async{
                        context.read<ProductDetailsProvider>().goToPage({'product_id':products[index].id});
                        // _marqueerController.start();
                      },
                      child: Text(
                        (products[index].title??"")+" | ",
                        style: TextStyleClass.normalStyle(color: Colors.white),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
