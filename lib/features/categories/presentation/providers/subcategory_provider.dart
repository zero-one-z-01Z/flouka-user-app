import 'package:flutter/material.dart';
import '../../domain/entity/category_entity.dart';

class SubcategoryProvider extends ChangeNotifier {
  List<CategoryEntity> _subcategories = [];
  bool _isLoading = false;
  String? _error;
  CategoryEntity? _selectedSubcategory;
  int? _categoryId;

  List<CategoryEntity> get subcategories => _subcategories;
  bool get isLoading => _isLoading;
  String? get error => _error;
  CategoryEntity? get selectedSubcategory => _selectedSubcategory;
  int? get categoryId => _categoryId;

  Future<void> getSubcategories(CategoryEntity category) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

   _subcategories = category.subCategories?? [];
    _isLoading = false;
    notifyListeners();
  }

  void selectSubcategory(CategoryEntity subcategory) {
    if (_selectedSubcategory?.id == subcategory.id) {
      _selectedSubcategory = null;
    } else {
      _selectedSubcategory = subcategory;
    }
    notifyListeners();
  }

  Future<void> refresh(CategoryEntity category) async {
    _subcategories = [];
    _selectedSubcategory = null;
    _categoryId = null;
    await getSubcategories(category);
  }

  void clear() {
    _subcategories = [];
    _selectedSubcategory = null;
    _error = null;
    _isLoading = false;
    _categoryId = null;
    notifyListeners();
  }
}
