import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../domain/entity/category_entity.dart';
import '../../domain/usecases/category_usecase.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryUsecase categoryUseCases;

  CategoryProvider(this.categoryUseCases);
  List<CategoryEntity> _categories = [];
  CategoryEntity? _selectedCategory;
  List<CategoryEntity> homeCategories = [
    CategoryEntity(id: 1, image: AppImages.offer, name: 'offers_products', subCategories: []),
    CategoryEntity(id: 2, image: AppImages.bestSeller, name: 'best_sellers', subCategories: []),
    CategoryEntity(id: 3, image: AppImages.categories, name: 'categories', subCategories: []),
    CategoryEntity(id: 4, image: AppImages.exploreCategories, name: 'explore', subCategories: []),
  ];

  List<CategoryEntity> get categories => _categories;
  CategoryEntity? get selectedCategory => _selectedCategory;

  Future<void> getCategories() async {
    notifyListeners();
    Map<String, dynamic> data = {"with_children": 1};
    Either<DioException, List<CategoryEntity>> response = await categoryUseCases
        .getCategories(data);

    response.fold((l) => showToast(l.message ?? "Error loading categories"), (r) {
      _categories.addAll(r);
      notifyListeners();
    });

    if (_categories.isNotEmpty && _selectedCategory == null) {
      _selectedCategory = null; // default = show all
    }

    //  Either<DioException, List<BannersEntity>> response = await bannersUseCase
    //     .getBanners(data);

    // response.fold((l) => showToast(l.message ?? "Error loading banners"), (r) {
    //   bannersList.addAll(r);
    notifyListeners();
  }

  void selectCategory(CategoryEntity category) {
    if (_selectedCategory?.id == category.id) {
      _selectedCategory = null;
    } else {
      _selectedCategory = category;
    }
    notifyListeners();
  }

  Future<void> refresh() async {
    _categories = [];
    _selectedCategory = null;
    await getCategories();
  }

  void clear() {
    _categories = [];
    _selectedCategory = null;
    notifyListeners();
  }
}
