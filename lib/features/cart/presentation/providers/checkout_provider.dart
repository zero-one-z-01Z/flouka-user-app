import 'dart:developer';

import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flouka/features/navbar/presentation/views/nav_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/core/dialog/new_success_dialog.dart';
import 'package:flouka/core/models/text_field_model.dart';
import 'package:flouka/features/address/presentation/providers/address_provider.dart';
import 'package:flouka/features/cart/domain/entity/coupon_entity.dart';
import 'package:flouka/features/cart/presentation/providers/coupon_provider.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/widgets/payment_online_page.dart';
import '../../../language/presentation/provider/language_provider.dart';
// import '../../../orders/presentation/views/orders_view.dart';
import '../../../navbar/presentation/provider/nav_provider.dart';
import '../../../orders/domain/use_case/order_use_case.dart';
import '../../../orders/presentation/provider/order_provider.dart';
import '../../../wallet/presentation/provider/wallet_provider.dart';
import '../../domain/entity/payment_method_entity.dart';
import '../views/checkout_view.dart';
import 'cart_provider.dart';

class CheckoutProvider extends ChangeNotifier {
  final OrderUseCase orderUseCase;
  CheckoutProvider(this.orderUseCase);

  late num tax;

  late num delivery;

  late num cartPrice;

  late num subTotalTax;

  CouponEntity? couponEntity;

  late num total;
  NavBarProvider navBarProvider = Provider.of<NavBarProvider>(
    Constants.globalContext(),
    listen: false,
  );
  OrderProvider ordersProvider = Provider.of<OrderProvider>(
    Constants.globalContext(),
    listen: false,
  );
  AddressProvider addressProvider = Provider.of<AddressProvider>(
    Constants.globalContext(),
    listen: false,
  );
  final couponProvider = Provider.of<CouponProvider>(
    Constants.globalContext(),
    listen: false,
  );
  Future createOrder() async {
    Map<String, dynamic> dataToUse = {};
    dataToUse['address_id'] = addressProvider.addressEntity?.id;
    dataToUse['total'] = total;
    dataToUse['sub_total'] = cartPrice;
    log(cartPrice.toString());
    dataToUse['delivery'] = delivery;
    dataToUse["coupon"] = couponProvider.coupon.text;
    dataToUse["discount"] = (couponProvider.calcCoupon(subTotalTax) ?? 0);
    dataToUse["payment_method"] = selectedPaymentMethod.toAPI;
    dataToUse['tax'] = tax;
    final result = await orderUseCase.createOrder(dataToUse);
    result.fold(
      (l) {
        showToast(l.message!);
      },
      (r) {
        WalletProvider walletProvider = Provider.of(
          Constants.globalContext(),
          listen: false,
        );
        walletProvider.decreaseWallet(total);
        newSuccessDialog(lottie: Lotties.loading);
        notifyListeners();
        navPARU(const NavBarView());
        navBarProvider.changeIndex(3);
        ordersProvider.goToPage();
        cart.clear();
      },
    );
    notifyListeners();
  }

  void goToPage([Map<String, dynamic>? inputs]) async {
    // delivery = settings.settingsEntity!.delivery;
    cartPrice = cart.caluclateTotal();
    // tax = (settings.settingsEntity!.tax / 100) * cartPrice;
    subTotalTax = cartPrice + tax;
    total =
        cartPrice + delivery + tax - (couponProvider.calcCoupon(subTotalTax) ?? 0);

    navP(const CheckoutView());
    // await refresh();
    notifyListeners();
  }

  List<TextFieldModel> coupon = [
    TextFieldModel(
      key: "coupon",
      controller: TextEditingController(),
      hint: "xxx xxx xxx xxx",
    ),
  ];

  List<PaymentMethodEntity> paymentMethods = [
    PaymentMethodEntity(
      image: Images.visa,
      paymentMethod: "visa",
      toAPI: "online",
    ),
    PaymentMethodEntity(
      image: Images.cash,
      paymentMethod: "cache",
      toAPI: "cash",
    ),
    PaymentMethodEntity(
      image: Images.wallet,
      paymentMethod: "wallet_app",
      toAPI: "wallet",
    ),
  ];

  late PaymentMethodEntity selectedPaymentMethod = paymentMethods.first;

  void selectPaymentMethod(PaymentMethodEntity paymentMethodEntity) {
    selectedPaymentMethod = paymentMethodEntity;
    notifyListeners();
  }

  bool isPaymentMethodSelected(PaymentMethodEntity paymentMethodEntity) {
    return selectedPaymentMethod.paymentMethod == paymentMethodEntity.paymentMethod;
  }

  // final settings = Provider.of<SettingsProvider>(
  //   Constants.globalContext(),
  //   listen: false,
  // );
  final cart = Provider.of<CartProvider>(Constants.globalContext(), listen: false);

  void makeOrder() async {
    if (selectedPaymentMethod.toAPI == "online") {
      navP(
        PaymentOnlinePage(total: total, type: 'order'),
        then: (val) {
          if (val == 'paid') {
            createOrder();
          } else if (val == 'filed') {
            showToast(LanguageProvider.translate('error', 'error'));
          }
        },
      );
    } else if (selectedPaymentMethod.toAPI == 'wallet') {
      bool check = await Provider.of<WalletProvider>(
        Constants.globalContext(),
        listen: false,
      ).checkWallet(moneyAmount: total);
      if (!check) {
        return;
      }
      createOrder();
    } else {
      createOrder();
    }
  }
}
