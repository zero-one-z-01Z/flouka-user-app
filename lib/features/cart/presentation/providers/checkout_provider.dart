import 'package:flouka/features/cart/presentation/providers/coupon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_lotties.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/new_success_dialog.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/loading.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/text_field_model.dart';
import '../../../../core/widgets/payment_online_page.dart';
import '../../../address/presentation/providers/address_provider.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../orders/domain/use_case/order_use_case.dart';
import '../../../orders/presentation/provider/order_provider.dart';
import '../../../settings/presentation/provider/settings_provider.dart';
import '../../../wallet/presentation/provider/wallet_provider.dart';
import '../../domain/entity/coupon_entity.dart';
import '../../domain/entity/payment_method_entity.dart';
import '../views/checkout_view.dart';
import 'cart_provider.dart';

class CheckoutProvider extends ChangeNotifier {
  final OrderUseCase orderUseCase;
  CheckoutProvider(this.orderUseCase);

  num subtotal() {
    num sub = 0;
    for (var element in cart.data ?? []) {
      sub += element.subTotal;
    }
    return sub;
  }

  num tax() {
    return (10 / 100) * subtotal();
  }

  num fees() {
    return (10 / 100) * subtotal();
  }

  num total() {
    return subtotal() + tax() + fees();
  }

  CouponEntity? couponEntity;

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
  Future<int?> createOrder() async {
    int? orderId;
    Map<String, dynamic> dataToUse = {};
    dataToUse['address_id'] = 1;
    dataToUse['total'] = total();
    dataToUse['sub_total'] = subtotal();
    dataToUse['fees'] = fees();
    dataToUse['tax'] = tax();
    // log(cartPrice.toString());
    // dataToUse['delivery'] = delivery;
    // dataToUse["coupon"] = couponProvider.coupon.text;
    // dataToUse["discount"] = (couponProvider.calcCoupon(subTotalTax) ?? 0);
    dataToUse["payment_method"] = selectedPaymentMethod.toAPI;
    // dataToUse['tax'] = tax;
    loading();
    final result = await orderUseCase.createOrder(dataToUse);
    navPop();
    result.fold(
      (l) {
        showToast(l.message!);
        return null;
      },
      (r) {
        if (selectedPaymentMethod.toAPI == 'wallet') {
          WalletProvider walletProvider = Provider.of(
            Constants.globalContext(),
            listen: false,
          );
          walletProvider.decreaseWallet(total());
        }
        if (selectedPaymentMethod.toAPI != 'online') {
          newSuccessDialog(lottie: Lotties.loading);
          notifyListeners();
          navPU();
          cart.clear();
        }
        orderId = r;
        return r;
      },
    );
    notifyListeners();
    return orderId;
  }

  void goToPage([Map<String, dynamic>? inputs]) async {
    navP(const CheckoutView());
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
      image: AppImages.visa,
      paymentMethod: "Debit/CreditCards",
      toAPI: "online",
    ),
    PaymentMethodEntity(
      image: AppImages.cash,
      paymentMethod: "Cach On Delivery",
      toAPI: "cash",
    ),
    PaymentMethodEntity(
      image: AppImages.wallet,
      paymentMethod: "Wallet App",
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

  final settings = Provider.of<SettingsProvider>(
    Constants.globalContext(),
    listen: false,
  );
  final cart = Provider.of<CartProvider>(Constants.globalContext(), listen: false);

  void makeOrder() async {
    if (['online'].contains(selectedPaymentMethod.toAPI)) {
      createOrder().then((value) {
        print('errrrrrrrrrrrrrr${value}');
        print('errrrrrrrrrrrrrr${total()}');

        navP(
          PaymentOnlinePage(total: total(), type: "order_$value"),
          then: (val) {
            if (val == 'paid') {
              navPU();
              cart.clear();
            } else if (val == 'filed') {
              showToast(LanguageProvider.translate('error', 'error'));
            }
            navPU();
            cart.clear();
          },
        );
      });
    } else if (selectedPaymentMethod.toAPI == 'wallet') {
      print('aaaaaaaaaaa${total()}');
      AuthProvider authProvider = Provider.of(
        Constants.globalContext(),
        listen: false,
      );
      print('aaaaaaaaaaa${authProvider.userEntity?.wallet}');
      bool check = await Provider.of<WalletProvider>(
        Constants.globalContext(),
        listen: false,
      ).checkWallet(moneyAmount: total());
      if (!check) {
        return;
      }
      createOrder();
    } else {
      createOrder();
    }
  }
}
