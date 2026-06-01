import 'package:flouka/core/widgets/button_widget.dart';
import 'package:flouka/core/widgets/drop_down_widget.dart';
import 'package:flouka/features/cart/presentation/providers/cart_operation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import 'package:flouka/features/products/presentation/providers/product_variant_provider.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../cart/presentation/providers/cart_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/product_quantity_provider.dart';
import '../providers/products_details_provider.dart';

class AddToCartWidget extends StatelessWidget {
  const AddToCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final ProductDetailsProvider productDetailsProvider = Provider.of<ProductDetailsProvider>(context);
    final productQuantity = Provider.of<ProductQuantityProvider>(context);
    final AuthProvider authProvider = Provider.of<AuthProvider>(context);

    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 1.h,),
        DropDownWidget(dropDownClass:productQuantity, canPress: productDetailsProvider.isAllAttributesSelected(),),
        SizedBox(height: 2.h,),
        ButtonWidget(onTap: (){
          if(productDetailsProvider.isAllAttributesSelected() && productQuantity.quantity!=null
          && authProvider.userEntity?.addressEntity!=null){
            cartProvider.addToCart(storeId: productDetailsProvider.data!.store!.id, quantity: productQuantity.quantity!,
                storeProductStockId: productDetailsProvider.variantEntity()!.stock!.productVariantId);
          }else{
            if(authProvider.userEntity?.addressEntity == null){
              showToast(LanguageProvider.translate("error", "add_address"));
            }else if(!productDetailsProvider.isAllAttributesSelected()){
              showToast(LanguageProvider.translate("error", "select_attributes_quantity"));
            }else {
              showToast(LanguageProvider.translate("error", "select_quantity"));
            }

          }

        }, text: 'add_to_cart',
          borderRadius: 12,width: 100.w, color: productDetailsProvider.isAllAttributesSelected() &&
              productQuantity.quantity!=null && authProvider.userEntity?.addressEntity!=null
              ? AppColor.primaryColor : AppColor.primaryColor.withValues(alpha: 0.2),),
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