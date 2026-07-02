import 'package:flouka/core/helper_function/convert.dart';
import 'package:flouka/features/cart/presentation/providers/coupon_provider.dart';
import 'package:flouka/features/settings/domain/entities/settings_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_lotties.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/new_success_dialog.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/loading.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/widgets/payment_online_page.dart';
import '../../../address/presentation/providers/address_provider.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../navbar/presentation/provider/nav_bar_provider.dart';
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
    return convertDataToNum(sub.toStringAsFixed(2))!;
  }
  num deliveryPrice() {
    final settings =
    Constants.globalContext().read<SettingsProvider>().settingsEntity!;

    final num basePrice = settings.deliveryPrice;

    final int storesCount =
        cart.data?.map((e) => e.storeId).toSet().length ?? 0;

    if (storesCount <= 1) {
      return basePrice;
    }

    return basePrice + ((storesCount - 1) * (basePrice / 2));
  }

  num tax() {
    SettingsProvider settingsProvider=Provider.of<SettingsProvider>(Constants.globalContext(), listen: false,);
    return convertDataToNum((((settingsProvider.settingsEntity?.tax??0) / 100) *
        (subtotal() - (couponProvider.calcDiscount() ?? 0))).toStringAsFixed(2))!;

  }

  num total() {
    CouponProvider couponProvider=Provider.of<CouponProvider>(Constants.globalContext(), listen: false,);
    return convertDataToNum((subtotal() + tax()).toStringAsFixed(2))! - ((couponProvider.calcDiscount() ?? 0))+deliveryPrice() ;
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
    AuthProvider authProvider = Provider.of<AuthProvider>(Constants.globalContext(), listen: false,);
    dataToUse['address_id'] = authProvider.userEntity?.addressEntity?.id;
    dataToUse['total'] = total();
    dataToUse['delivery_price'] = deliveryPrice();
    dataToUse['sub_total'] = subtotal();
    dataToUse['tax'] = tax();
    dataToUse["payment_method"] = selectedPaymentMethod.toAPI;

    dataToUse['discount'] = (couponProvider.calcDiscount() ?? 0);
    for (int i=0;i<(couponProvider.couponEntity?.length ??0);i++) {
      dataToUse['coupons[$i][coupon]'] = couponProvider.couponEntity?[i].coupon;
      dataToUse['coupons[$i][discount]'] = couponProvider.couponEntity?[i].discount;

    }
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
          WalletProvider walletProvider = Provider.of(Constants.globalContext(), listen: false,);
          walletProvider.decreaseWallet(total());
        }
        if (selectedPaymentMethod.toAPI != 'online') {
          newSuccessDialog(lottie: Lotties.loading,then: (){
            navPU();
            Constants.globalContext().read<NavBarProvider>().changeIndex(0);
            cart.refresh();
          });
          notifyListeners();

        }
        if(selectedPaymentMethod.toAPI == "cash"){

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

        navP(
          PaymentOnlinePage(total: total(), type: "order_$value"),
          then: (val) {
            if (val == 'paid') {
              navPU();
              ordersProvider.goToPage();
              cart.clear();
            } else if (val == 'filed') {
              showToast(LanguageProvider.translate('error', 'error'));
            }
            navPU();
            cart.refresh();
          },
        );
      });
    } else if (selectedPaymentMethod.toAPI == 'wallet') {
      AuthProvider authProvider = Provider.of(Constants.globalContext(), listen: false,);
      bool check = await Provider.of<WalletProvider>(Constants.globalContext(), listen: false,)
          .checkWallet(moneyAmount: total());
      if (!check) {
        return;
      }
      createOrder();
    } else {
      createOrder();
    }
  }
}
