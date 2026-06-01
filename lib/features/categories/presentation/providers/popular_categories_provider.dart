import 'package:flouka/core/dialog/snack_bar.dart';
import 'package:flouka/features/categories/domain/entity/popular_categories_entity.dart';
import 'package:flutter/material.dart';
import '../../domain/usecases/category_usecase.dart';

class PopularCategoriesProvider extends ChangeNotifier {
  final CategoryUsecase categoryUseCases;

  PopularCategoriesProvider(this.categoryUseCases);

  List<PopularCategoriesEntity> _categories = [];
  PopularCategoriesEntity? _selectedCategory;
  bool _isLoading = false;
  String? _error;

  List<PopularCategoriesEntity> get categories => _categories;
  PopularCategoriesEntity? get selectedCategory => _selectedCategory;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Static home navigation tiles (not from API)
  // List<PopularCategoriesEntity> homeCategories = [];

  Future<void> getCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final response = await categoryUseCases.popularCategories();

    response.fold(
          (failure) {
        _error = failure.message ?? 'Error loading categories';
        showToast(_error!);
      }, (categoriesList) {
        _categories = categoriesList;
        if (_categories.isNotEmpty && _selectedCategory == null) {
          _selectedCategory = null; // default = show all
        }
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  void selectCategory(PopularCategoriesEntity category) {
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
