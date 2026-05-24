import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/core/widgets/drop_down_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../cart/presentation/providers/cart_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/product_quantity_provider.dart';
import '../providers/products_details_provider.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productDetailsProvider = Provider.of<ProductDetailsProvider>(context);
    final productQuantity = Provider.of<ProductQuantityProvider>(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.h,),
        DropDownWidget(dropDownClass:productQuantity ),
        SizedBox(height: 2.h,),
        ButtonWidget(onTap: (){}, text: 'add_to_cart',
          borderRadius: 12,width: 100.w,),
        SizedBox(height: 4.h,),
      ],
    );
  }
}

class _QuantityBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityBtn({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black, size: 18),
      ),
    );
  }
}