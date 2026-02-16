import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flouka/features/cart/presentation/providers/coupon_provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/guest_dialog.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/entity/cart_entity.dart';
import '../../domain/use_case/cart_use_case.dart';
import '../views/cart_view.dart';

class CartProvider extends ChangeNotifier
    implements ProviderStructureModel<List<CartEntity>> {
  final CartUseCase cartUseCase;

  CartProvider(this.cartUseCase);

  @override
  List<CartEntity>? data;

  @override
  Map? inputs;

  @override
  void clear() {
    data = null;
    inputs = null;
    notifyListeners();
  }

  @override
  Future getData() async {
    final result = await cartUseCase.getCart();
    result.fold(
      (l) {
        showToast(l.message!);
        log(l.message!);
      },
      (r) {
        data ??= [];
        data!.addAll(r);
      },
    );

    notifyListeners();
  }

  @override
  void goToPage([Map<String, dynamic>? inputs]) async {
    if (Provider.of<AuthProvider>(
          Constants.globalContext(),
          listen: false,
        ).userEntity ==
        null) {
      showGuestDialog();
    } else {
      Provider.of<CouponProvider>(Constants.globalContext(), listen: false).coupon =
          TextEditingController(text: '');
      Provider.of<CouponProvider>(
        Constants.globalContext(),
        listen: false,
      ).isApplied = false;
      refresh();
      navP(const CartView());
      notifyListeners();
    }
  }

  @override
  Future refresh() async {
    clear();
    await getData();

    notifyListeners();
  }

  num caluclateTotal() {
    final couponProvider = Provider.of<CouponProvider>(
      Constants.globalContext(),
      listen: false,
    );
    if (data == null) {
      return 0;
    }
    num allSubTotal = 0;
    for (var element in data!) {
      allSubTotal += element.subTotal;
    }
    // if (couponProvider.isApplied) {
    //   allSubTotal = allSubTotal - couponProvider.calcCoupon(allSubTotal)!;
    // }
    return allSubTotal;
  }

  ScrollController controller = ScrollController();
  void rebuild() {
    notifyListeners();
  }

  TextEditingController couponController = TextEditingController();
}
