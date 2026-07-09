import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/features/cart/presentation/providers/cart_operation_provider.dart';
import 'package:flouka/features/products/presentation/providers/products_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/config/app_styles.dart';
import '../../../../core/helper_function/convert.dart';
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
    String? name = cartEntity.variant !=null ? (cartEntity.variant!.name) : (cartEntity.product!.title);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 1.h,
      children: [
        InkWell(
          onTap: (){
            context.read<ProductDetailsProvider>().goToPage({'product_id':cartEntity.product!.id});
          },
          child: Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color:const Color(0xffF9FAFB),
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
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  name ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyleClass.normalStyle().copyWith(
                                    color: const Color(0xff333542),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  cartProvider.deleteCartItem(cartEntity.id!);
                                },
                                child: const Icon(Icons.clear, color: Colors.red),
                              ),
                            ],
                          ),
                          Wrap(
                            children: List.generate(cartEntity.variant?.attributeValues.length??0, (index) =>
                                Text(
                                  " ${cartEntity.variant?.attributeValues[index].attributeName??""} : ${cartEntity.variant?.attributeValues[index].valueName??""} ${index < (cartEntity.variant!.attributeValues.length - 1) ? " | " : ""}",
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyleClass.normalStyle().copyWith(
                                    color: const Color(0xff333542),
                                  ),
                                ),
                            ),
                          ),
                          Row(
                            spacing: 4,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: PriceWidget(
                                  price: convertDataToNum(cartEntity.subTotal.toStringAsFixed(2)) ?? 0,
                                ),
                              ),

                              Expanded(
                                child: ButtonsActionCartWidget(
                                  count: cartEntity.quantity!,
                                  max: cartEntity.stock ?? 0,
                                  onAdd: () {
                                    if(cartEntity.quantity! < cartEntity.stock!){
                                      cartProvider.increaseCart(cartEntity.id!);
                                    }
                                  },
                                  onRemove: () {
                                    if(cartEntity.quantity! >1){
                                      cartProvider.decreaseCart(cartEntity.id!);
                                    }
                                  },
                                ),
                              ),
                              // const Spacer(),
                              // CustomStarRatingWidget(rating: cartEntity.product?.rate ?? 0, readOnly: true,),
                              // Text(
                              //   "${cartEntity.product?.rate ?? 0}",
                              //   style: TextStyleClass.smallStyle(color: Colors.grey),
                              // ),
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
        ),
        // Row(
        //   children: [
        //
        //     // const Spacer(),
        //     // GestureDetector(
        //     //   onTap: () {
        //     //     context.read<FavoriteProvider>().toggleFavorite(cartEntity.product!);
        //     //   },
        //     //   child: Consumer<FavoriteProvider>(
        //     //     builder: (context, provider, child) {
        //     //       bool isFav = provider.favoriteIds.contains(cartEntity.product!.id);
        //     //       return CustomIconWidget(svg: AppImages.heart,color: isFav?Colors.red:null,);
        //     //     },
        //     //   ),
        //     // ),
        //     // const CustomIconWidget(svg: AppImages.heart),
        //     SizedBox(width: 2.w),
        //     GestureDetector(
        //       onTap: () {
        //         cartProvider.deleteCartItem(cartEntity.id!);
        //       },
        //       child: const CustomIconWidget(svg: AppImages.trash),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
