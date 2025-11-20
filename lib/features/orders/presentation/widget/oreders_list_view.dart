import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flouka/core/widgets/empty_animation.dart';
import 'package:flouka/core/widgets/loading_widget.dart';
import 'package:flouka/features/orders/presentation/widget/oreder_item_widget.dart';

import '../../../../core/widgets/loading_animation_widget.dart';
import '../provider/order_provider.dart';

class OrdersListViewWidget extends StatelessWidget {
  const OrdersListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderProvider orderProvider = Provider.of<OrderProvider>(context);
    return Builder(
      builder: (context) {
        if (orderProvider.data == null) {
          return const Center(child: LoadingAnimationWidget(gif: Lotties.loading));
        }
        if (orderProvider.data!.isEmpty) {
          return const Center(
            child: EmptyAnimation(title: "", gif: Lotties.noSearch),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                controller: orderProvider.controller,
                itemBuilder: (context, index) {
                  return OrderItemWidget(orderEntity: orderProvider.data![index]);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 16);
                },
                itemCount: orderProvider.data?.length ?? 0,
              ),
            ),
            if (orderProvider.paginationStarted)
              const Center(child: LoadingWidget()),
          ],
        );
      },
    );
  }
}
