import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flouka/features/orders/presentation/provider/order_provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/widgets/empty_animation.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../widget/oreder_item_widget.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderProvider ordersProvider = Provider.of(context);
    // ordersProvider.pagination();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LanguageProvider.translate("global", "orders"),
          style: TextStyleClass.normalStyle().copyWith(fontWeight: FontWeight.w600,
          color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ordersProvider.refresh();
        },
        child: Builder(
          builder: (context) {
            if (ordersProvider.data == null) {
              return const Center(
                child: LoadingAnimationWidget(gif: Lotties.loading),
              );
            }
            if (ordersProvider.data!.isEmpty) {
              return const Center(
                child: EmptyAnimation(title: "", gif: Lotties.noSearch),
              );
            }
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Column(
                children: [
                  SizedBox(height: 3.h),
                  ...List.generate(
                    ordersProvider.data!.length,
                    (index) => OrderItemWidget(orderEntity: ordersProvider.data![index]),
                  ),
                  SizedBox(height: 6.h),

                  // Expanded(
                  //   child: ListView.separated(
                  //     controller: ordersProvider.controller,
                  //     itemBuilder: (context, index) {
                  //       return OrderItemWidget(
                  //         orderEntity: ordersProvider.data![index],
                  //       );
                  //     },
                  //     separatorBuilder: (context, index) {
                  //       return const SizedBox(height: 16);
                  //     },
                  //     itemCount: ordersProvider.data?.length ?? 0,
                  //   ),
                  // ),
                  if (ordersProvider.paginationStarted)
                    const Center(child: LoadingWidget()),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
 // padding: const EdgeInsets.symmetric(horizontal: 17),