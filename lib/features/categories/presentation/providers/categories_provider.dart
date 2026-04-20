import 'dart:developer';

import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/core/dialog/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../navbar/presentation/provider/nav_bar_provider.dart';
import '../../../products/presentation/providers/categories_product_search_provider.dart';
import '../../domain/entity/category_entity.dart';
import '../../domain/usecases/category_usecase.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryUsecase categoryUseCases;

  CategoryProvider(this.categoryUseCases);

  List<CategoryEntity> _categories = [];
  CategoryEntity? _selectedCategory;
  bool _isLoading = false;
  String? _error;

  List<CategoryEntity> get categories => _categories;
  CategoryEntity? get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Static home navigation tiles (not from API)
  // List<CategoryEntity> homeCategories = [];
  List<CategoryEntity> get homeCategories => completeCategoryItems();

  List<CategoryEntity> completeCategoryItems(){
  return   [
      CategoryEntity(id: 1, image: AppImages.offer, name: 'offers_products',onTap: (){
        CategoriesProductSearchProvider provider = Provider.of(Constants.globalContext(),listen: false);
        provider.goToPage({'offers_products' : 1});

      },parentId: null),
      CategoryEntity(id: 2,parentId: null, image: AppImages.bestSeller, name: 'best_sellers',onTap: (){
        CategoriesProductSearchProvider provider = Provider.of(Constants.globalContext(),listen: false);
        provider.goToPage({'best_selling' : 1});
      }),
      CategoryEntity(id: 3,parentId: null, image: AppImages.categories, name: 'categories',onTap: (){
        NavBarProvider navBarProvider = Provider.of(Constants.globalContext(),listen: false);
        navBarProvider.changeIndex(1);
      }),
      CategoryEntity(id: 4,parentId: null, image: AppImages.exploreCategories, name: 'explore',onTap: (){
        CategoriesProductSearchProvider provider = Provider.of(Constants.globalContext(),listen: false);
        provider.clearSearch();

      }),
    ];
  }

  Future<void> getCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final response = await categoryUseCases.getCategories();

    response.fold(
      (failure) {
        _error = failure.message ?? 'Error loading categories';
        showToast(_error!);
      },
      (categoriesList) {
        _categories = categoriesList;
        if (_categories.isNotEmpty && _selectedCategory == null) {
          _selectedCategory = null; // default = show all
        }
      },
    );

    _isLoading = false;
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
    _error = null;
    await getCategories();
  }

  void clear() {
    _categories = [];
    _selectedCategory = null;
    _error = null;
    _isLoading = false;
    notifyListeners();
  }


}
