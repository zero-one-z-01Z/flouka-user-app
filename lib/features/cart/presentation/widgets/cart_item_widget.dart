import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/features/cart/presentation/providers/cart_operation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/helper_function/convert.dart';
import '../../../../core/widgets/custom_icon_widget.dart';
import '../../../../core/widgets/custom_star_rating_widget.dart';
import '../../../../core/widgets/price_widget.dart';
import '../../domain/entity/cart_entity.dart';
import '../providers/cart_provider.dart';
import 'button_action_cart_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 1.h,
      children: [
        Container(
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    width: 20.w,
                    imageUrl:
                        cartEntity.product?.image ?? "https://placehold.co/600x400",
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Column(
                      spacing: 0.5.h,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartEntity.variant?.name?? "",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyleClass.normalStyle().copyWith(
                            color: const Color(0xff333542),
                          ),
                        ),
                        Wrap(
                          children: List.generate(cartEntity.variant?.attributeValues.length??0, (index) =>
                              Row(children: [
                                    Expanded(
                                      child: Text(
                                        cartEntity.variant?.attributeValues[index].attributeName??"",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyleClass.normalStyle().copyWith(
                                          color: const Color(0xff333542),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        cartEntity.variant?.attributeValues[index].valueName??"",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyleClass.normalStyle().copyWith(
                                          color: const Color(0xff333542),
                                        ),
                                      ),
                                    ),
                              ],
                              ),
                          ),
                        ),
                        Row(
                          spacing: 4,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            PriceWidget(
                              price: convertDataToNum(cartEntity.subTotal.toStringAsFixed(2)) ?? 0,
                            ),
                            const Spacer(),
                            CustomStarRatingWidget(rating: cartEntity.product?.rate ?? 0, readOnly: true,),
                            Text(
                              "${cartEntity.product?.rate ?? 0}",
                              style: TextStyleClass.smallStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            ButtonsActionCartWidget(
              count: cartEntity.quantity!,
              onAdd: () {
                cartProvider.increaseCart(cartEntity.id!);
              },
              onRemove: () {
                cartProvider.decreaseCart(cartEntity.id!);
              },
            ),
            const Spacer(),

            const CustomIconWidget(svg: AppImages.heart),
            SizedBox(width: 2.w),
            GestureDetector(
              onTap: () {
                cartProvider.deleteCartItem(cartEntity.id!);
              },
              child: const CustomIconWidget(svg: AppImages.trash),
            ),
          ],
        ),
      ],
    );
  }
}
