import 'package:flouka/core/config/app_color.dart';
import 'package:flouka/features/products/presentation/providers/product_variant_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../providers/product_quantity_provider.dart';
import '../providers/products_details_provider.dart';
import 'add_to_cart_widget.dart';

class ProductAttributesWidget extends StatelessWidget {
  const ProductAttributesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductDetailsProvider productDetailsProvider = Provider.of<ProductDetailsProvider>(context);
    final ProductQuantityProvider productQuantity = Provider.of<ProductQuantityProvider>(context);
    return Column(
      children: [
        if (productDetailsProvider.data!.attributes.isNotEmpty) ...[
          Builder(
            builder: (context) {

              return Column(spacing: 1.5.h,
                children: List.generate(productDetailsProvider.data!.attributes.length,
                      (index) => Row(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productDetailsProvider.data!.attributes[index].name,
                        style: TextStyleClass.semiHeadStyle(color: Colors.black,),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: Row(spacing: 2.w,
                          children: List.generate(
                            productDetailsProvider.data!.attributes[index].values.length, (attributeIndex) {
                              final attribute = productDetailsProvider.data!.attributes[index].values[attributeIndex];
                              final attributeId = attribute.id;
                              final isHidden = productDetailsProvider.hide(index, attributeId);
                              final isSelected = productDetailsProvider.isSelected(index, attributeId);

                              return AnimatedOpacity(
                                duration: const Duration(milliseconds:300),
                                opacity: isHidden ? 0.4 : 1,
                                child: InkWell(
                                  onTap: isHidden ? null : () {
                                    productDetailsProvider.onTap(index, attributeId,);
                                    productQuantity.reset();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 4.w,
                                      vertical: 0.5.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color:  Colors.white,
                                      border: Border.all(
                                        color: isSelected ? AppColor.secondaryColor : Colors.grey.shade300,
                                      ),
                                      borderRadius: BorderRadius.circular(33),
                                    ),
                                    child: Text(
                                      attribute.value,
                                      style: TextStyleClass.normalStyle(
                                        color: isHidden ? Colors.grey : isSelected ? AppColor.primaryColor : Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],

        SizedBox(height: 2.h),
        if(productDetailsProvider.isAllAttributesSelected())
        const AddToCartWidget(),
      ],
    );
  }
}
