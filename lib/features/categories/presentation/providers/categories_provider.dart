import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../domain/entity/category_entity.dart';
import '../../domain/usecases/category_usecase.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryUsecase categoryUseCases;

  CategoryProvider(this.categoryUseCases);

  List<CategoryEntity> _categories = [];
  bool _isLoading = false;
  String? _error;
  CategoryEntity? _selectedCategory;

  List<CategoryEntity> get categories => _categories;
  bool get isLoading => _isLoading;
  String? get error => _error;
  CategoryEntity? get selectedCategory => _selectedCategory;

  Future<void> getCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    Either<DioException, List<CategoryEntity>> result = await categoryUseCases
        .getCategories();

    result.fold(
      (failure) {
        _error = failure.message;
        _categories = [];
        showToast(_error ?? "Error loading categories");
      },
      (data) {
        _categories = data;
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
