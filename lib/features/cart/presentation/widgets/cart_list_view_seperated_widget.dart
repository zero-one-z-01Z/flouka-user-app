import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/empty_animation.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../providers/cart_provider.dart';
import 'cart_item_widget.dart';

class CartListViewSeperatedWidget extends StatelessWidget {
  const CartListViewSeperatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Builder(
      builder: (context) {
        if (cartProvider.data == null) {
          return const Center(
            child: Center(child: LoadingAnimationWidget(gif: Lotties.loading)),
          );
        }
        if (cartProvider.data!.isEmpty) {
          return Center(
            child: EmptyAnimation(
              title: LanguageProvider.translate("global", "cart_is_empty"),

              gif: Lotties.cartAnimation,
            ),
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cartProvider.data!.length,
          itemBuilder: (context, index) {
            return CartItemWidget(cartEntity: cartProvider.data![index]);
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 5.h,
              child: const Divider(color: Color(0xffe3e3e3)),
            );
          },
        );
      },
    );
  }
}
