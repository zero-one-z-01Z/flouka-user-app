import 'package:flouka/features/products/presentation/providers/product_variant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/app_styles.dart';
import '../providers/products_details_provider.dart';

class ProductAttributesWidget extends StatelessWidget {
  const ProductAttributesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductDetailsProvider productDetailsProvider = Provider.of<ProductDetailsProvider>(context);
    return Column(
      children: [
        if (productDetailsProvider.data!.attributes.isNotEmpty) ...[
          Builder(
            builder: (context) {
              return Column(
                children: List.generate(productDetailsProvider.data!.attributes.length,
                      (index) => Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productDetailsProvider.data!.attributes[index].name,
                        style: TextStyleClass.semiHeadStyle(color: Colors.black,),
                      ),
                      SizedBox(height: 2.h),
                      Row(spacing: 2.w,
                        children: List.generate(
                          productDetailsProvider.data!.attributes[index].values.length, (attributeIndex) => InkWell(
                          onTap: (){
                            productDetailsProvider.onTap(index, attributeIndex);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h,),
                            decoration: BoxDecoration(color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5),),
                            child: Text(
                              productDetailsProvider.data!.attributes[index].values[attributeIndex].value,
                              style: TextStyleClass.normalStyle(color: Colors.black,),
                            ),
                          ),
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 2.h),
        ]
      ],
    );
  }
}
