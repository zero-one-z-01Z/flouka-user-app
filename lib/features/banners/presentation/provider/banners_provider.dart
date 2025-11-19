import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../domain/entities/banner_entity.dart';
import '../../domain/usecases/banners_usecases.dart';

class BannersProvider with ChangeNotifier {
  int currentIndex = 0;
  List<BannersEntity> bannersList = [];
  final BannersUseCase bannersUseCase;

  BannersProvider(this.bannersUseCase);

  Future<void> getBanners() async {
    Map<String, dynamic> data = {};
    bannersList.clear();
    notifyListeners();

    Either<DioException, List<BannersEntity>> response = await bannersUseCase
        .getBanners(data);

    response.fold((l) => showToast(l.message ?? "Error loading banners"), (r) {
      bannersList.addAll(r);
      notifyListeners();
    });
  }

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
