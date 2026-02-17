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
    _categoryId = category.id;
    notifyListeners();

    // Fake subcategories instead of API call
    if (categoryId == 1) {
      _subcategories = [
        CategoryEntity(
          name: 'subcategory_1_1',
          image: 'https://placehold.co/600x400/FF5722/FFFFFF/png',
          id: 1,
          subCategories: [],
        ),
        CategoryEntity(
          name: 'subcategory_1_2',
          image: 'https://placehold.co/600x400/3F51B5/FFFFFF/png',
          id: 2,
          subCategories: [],
        ),
        CategoryEntity(
          name: 'subcategory_1_3',
          image: 'https://placehold.co/600x400/4CAF50/FFFFFF/png',
          id: 3,
          subCategories: [],
        ),
      ];
    } else if (categoryId == 2) {
      _subcategories = [
        CategoryEntity(
          name: 'subcategory_2_1',
          image: 'https://placehold.co/600x400/9C27B0/FFFFFF/png',
          id: 1,
          subCategories: [],
        ),
        CategoryEntity(
          name: 'subcategory_2_2',
          image: 'https://placehold.co/600x400/00BCD4/FFFFFF/png',
          id: 2,
          subCategories: [],
        ),
      ];
    } else if (categoryId == 3) {
      _subcategories = [
        CategoryEntity(
          name: 'subcategory_3_1',
          image: 'https://placehold.co/600x400/8BC34A/000000/png',
          id: 1,
          subCategories: [],
        ),
        CategoryEntity(
          name: 'subcategory_3_2',
          image: 'https://placehold.co/600x400/FFC107/000000/png',
          id: 2,
          subCategories: [],
        ),
        CategoryEntity(
          name: 'subcategory_3_3',
          image: 'https://placehold.co/600x400/E91E63/FFFFFF/png',
          id: 3,
          subCategories: [],
        ),
      ];
    } else {
      _subcategories = [
        CategoryEntity(
          name: 'subcategory_other_1',
          image: 'https://placehold.co/600x400/607D8B/FFFFFF/png',
          id: 1,
          subCategories: [],
        ),
        CategoryEntity(
          name: 'subcategory_other_2',
          image: 'https://placehold.co/600x400/795548/FFFFFF/png',
          id: 2,
          subCategories: [],
        ),
      ];
    }

    if (_subcategories.isNotEmpty && _selectedSubcategory == null) {
      _selectedSubcategory = null; // default = show all
    }

    //  Either<DioException, List<CategoryEntity>> response = await subcategoryUseCase
    //     .getSubcategories(data);

    // response.fold((l) => showToast(l.message ?? "Error loading subcategories"), (r) {
    //   _subcategories.addAll(r);

    _isLoading = false;
    notifyListeners();
  }

  void selectSubcategory(CategoryEntity subcategory) {
    if (_selectedSubcategory?.name == subcategory.name) {
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
