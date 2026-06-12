import 'package:cached_network_image/cached_network_image.dart';
import 'package:flouka/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/helper_function/convert.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/custom_star_rating_widget.dart';
import '../../../../core/widgets/price_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../reviews/presentation/providres/create_rate_provider.dart';
import '../../domain/entity/order_entity.dart';
import '../provider/get_edit_order_provider.dart';
import '../provider/order_details_provider.dart';
import 'item_out_of_stock_widget.dart';
import 'share_your_experience_widget.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({super.key, required this.orderEntity});
  final OrderEntity orderEntity;
  @override
  Widget build(BuildContext context) {
    final OrderDetailsProvider orderDetailsProvider = Provider.of<OrderDetailsProvider>(context);
    final CreateRateProvider createRateProvider = Provider.of<CreateRateProvider>(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 1.w,
            children: [
              Text(
                LanguageProvider.translate("global", "Order ID"),
                style: TextStyleClass.normalStyle().copyWith(fontSize: 14.sp),
              ),
              Text(
                orderEntity.id.toString(),
                style: TextStyleClass.normalStyle(
                  color: AppColor.primaryColor,
                ).copyWith(fontWeight: FontWeight.bold, fontSize: 15.sp),
              ),
            ],
          ),
          SizedBox(height: .2.h),
          Text(
            convertDateTimeToString(DateTime.parse(orderEntity.createdAt!)),
            style: TextStyleClass.smallStyle(),
          ),
          SizedBox(height: 1.h),
          Wrap(
            children: List.generate(orderEntity.vendorOrders?.length??0, (index) {
              return InkWell(
                onTap: (){
                  orderDetailsProvider.goToPage({
                    'order_id': orderEntity.id,
                    'order_vendor_id': orderEntity.vendorOrders?[index].id,
                  });
                },
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10.w,
                          height: 10.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(fit:BoxFit.cover,
                                image: CachedNetworkImageProvider(orderEntity.vendorOrders?[index].vendor?.logo ?? " "))
                          ),
                        ),
                        SizedBox(width: 2.w,),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(orderEntity.vendorOrders?[index].vendor?.name ?? " ",style: TextStyleClass.smallStyle(),),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${orderEntity.vendorOrders?[index].store?.rate.toString()}",
                                  style: TextStyleClass.headStyle(
                                    color: Colors.black,
                                  ).copyWith(fontWeight: FontWeight.bold, fontSize: 15.sp),
                                ),
                                SizedBox(width: 2.w),
                                CustomStarRatingWidget(itemSize: 15.sp, rating: orderEntity.vendorOrders?[index].store?.rate ?? 0, readOnly: true,),
                              ],
                            ),
                          ],
                        )),

                      ],
                    ),
                    SizedBox(height: 2.h),
                    Wrap(
                      children: List.generate(orderEntity.vendorOrders?[index].items?.length??0, (itemIndex) {
                        OrderItemEntity orderItem =orderEntity.vendorOrders![index].items![itemIndex];
                        String? name = orderItem.variant !=null ? (orderItem.variant!.name) : (orderItem.product!.title);

                        return InkWell(
                          onTap: (){
                            orderDetailsProvider.goToPage({
                              'order_id': orderEntity.id,
                              'order_vendor_id': orderEntity.vendorOrders?[index].id,
                            });
                          },
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  imageUrl: orderItem.product?.image ?? " ",width: 15.w,height: 10.w,fit: BoxFit.cover,
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name ?? " ",
                                      style: TextStyleClass.smallStyle(color: const Color(0xff333542),),
                                    ),
                                    SizedBox(height: .2.h),
                                    Text(
                                      LanguageProvider.translate("orders", orderItem.status?.text??"",),
                                      style: TextStyleClass.smallStyle(
                                        color: orderItem.status?.info["color"],
                                      ).copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 0.1.h),
                                    PriceWidget(price: orderItem.price!,fontSize: 13.sp,),
                                  ],
                                ),
                              ),
                              SizedBox(width: 2.w),
                              if(orderItem.canReviewProduct??false)
                              Expanded(
                                child: ButtonWidget(
                                  borderRadius: 10,
                                  color: const Color(0xffdff7ff),
                                  onTap: () {
                                    createRateProvider.gotoReviewPage(itemId: orderItem.productId!, orderId: orderEntity.id!, product: true);
                                  },
                                  text:"rate",
                                  textStyle: TextStyleClass.smallStyle(),
                                  height: 4.h,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                    Container(color: Colors.grey.shade200,width: 100.w,height: 0.2.h,
                    margin:  EdgeInsets.symmetric(vertical: 1.h),),
                  ],
                ),
              );
            },),
          ),
          SizedBox(height: 1.h),
          if(orderEntity.isAnyUnavailable())...[
            ItemOutOfStockWidget(id: orderEntity.id!,),
            SizedBox(height: 2.h),
          ],

          if(orderEntity.isAnyUnavailable() || orderEntity.status ==OrderStatus.paid)...[
            ButtonWidget(
              color: const Color(0xff950526),
              onTap: () {
                Provider.of<GetEditOrderProvider>(context,listen: false).cancelOrder(id: orderEntity.id!,isFromOrderDetails: true);
              },
              text: LanguageProvider.translate("orders", "cancel_entire_order"),
              textStyle: TextStyleClass.normalStyle().copyWith(color: Colors.white),
            ),
            SizedBox(height: 2.h),
          ],
          if(orderEntity.vendorOrders?.first.canRateStore??false)
            ShareYourExperienceWidget(StoreId: orderEntity.vendorOrders?.first.store?.id??0, orderId: orderEntity.id!,),
        ],
      ),
    );
  }
}
