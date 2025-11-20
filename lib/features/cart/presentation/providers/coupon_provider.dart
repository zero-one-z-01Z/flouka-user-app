import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/loading.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../domain/entity/coupon_entity.dart';
import '../../domain/use_case/cart_use_case.dart';
import 'cart_provider.dart';

class CouponProvider extends ChangeNotifier {
  CouponEntity? couponEntity;
  TextEditingController coupon = TextEditingController();
  final CartUseCase cartUseCase;
  CouponProvider(this.cartUseCase);

  bool isApplied = false;
  Future<void> getCoupon() async {
    Map<String, dynamic> data = {};
    if (coupon.text.isEmpty) {
      isApplied = false;
      return;
    }
    data['coupon'] = coupon.text;
    loading();
    Either<DioException, CouponEntity> response = await cartUseCase.getCoupon(
      data,
    );
    navPop();
    response.fold(
      (l) {
        showToast(l.message ?? "");
      },
      (r) {
        couponEntity = r;
        isApplied = true;
        notifyListeners();
        Provider.of<CartProvider>(
          Constants.globalContext(),
          listen: false,
        ).notifyListeners();
      },
    );
  }

  void handleTap() {
    if (!isApplied) {
      getCoupon();
    } else {
      isApplied = false;
      couponEntity = null;
      coupon.clear();
      notifyListeners();
      coupon.text = '';
    }
    Provider.of<CartProvider>(
      Constants.globalContext(),
      listen: false,
    ).notifyListeners();
  }

  num? calcCoupon(num price) {
    num discount = 0;
    if (couponEntity != null) {
      if (couponEntity!.type == "percentage") {
        if (price > couponEntity!.max!) {
          discount = (couponEntity!.max! * couponEntity!.value) / 100;
        } else {
          discount = (price * couponEntity!.value) / 100;
        }
        return discount;
      } else {
        discount = couponEntity!.value;
        return discount;
      }
    }
    return null;
  }

  void clear() {
    couponEntity = null;
    isApplied = false;
    coupon.text = '';
    notifyListeners();
  }
}
