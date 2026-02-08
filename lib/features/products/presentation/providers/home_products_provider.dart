import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/dialog/snack_bar.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:flouka/features/products/domain/user_case/product_use_case.dart';
import 'package:flutter/material.dart';

class HomeProductsProvider with ChangeNotifier {
  List<ProductEntity> productsList = [];
  final ProductUseCase productUseCase;

  HomeProductsProvider(this.productUseCase);

  Future<void> getProducts() async {
    productsList.clear();
    notifyListeners();

    Either<DioException, List<ProductEntity>> response = await productUseCase
        .getProducts({});

    response.fold((l) => showToast(l.message ?? "Error loading products"), (r) {
      productsList.addAll(r);
    });

    notifyListeners();
  }

  final List<String> filters = const [
    'For You',
    'New Gadget',
    'Best Silling',
    'Computer',
    'Mobile',
  ];

  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
