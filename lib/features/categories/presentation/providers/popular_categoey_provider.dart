import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../domain/entity/category_entity.dart';
import '../../domain/usecases/category_usecase.dart';

class HomeCategoreyProvider extends ChangeNotifier {
  final CategoryUsecase categoryUseCases;

  HomeCategoreyProvider(this.categoryUseCases);
  final List<CategoryEntity> _popularCategories = [];
  List<CategoryEntity> homeCategories = [
    CategoryEntity(id: 1, image: AppImages.offer, name: 'offers_products', subCategories: []),
    CategoryEntity(id: 2, image: AppImages.bestSeller, name: 'best_sellers', subCategories: []),
    CategoryEntity(id: 3, image: AppImages.categories, name: 'categories', subCategories: []),
    CategoryEntity(id: 4, image: AppImages.exploreCategories, name: 'explore', subCategories: []),
  ];

  List<CategoryEntity> get popularCategories => _popularCategories;

  Future<void> getPopularCategories() async {
    notifyListeners();

    Either<DioException, List<CategoryEntity>> response = await categoryUseCases
        .getCategories();

    response.fold((l) => showToast(l.message ?? "Error loading categories"), (r) {
      _popularCategories.addAll(r);
      notifyListeners();
    });
  }
}
