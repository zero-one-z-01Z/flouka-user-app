import 'package:flutter/material.dart';
import '../../domain/entity/subcategory_entity.dart';

class SubcategoryProvider extends ChangeNotifier {
  List<SubcategoryEntity> _subcategories = [];
  bool _isLoading = false;
  String? _error;
  SubcategoryEntity? _selectedSubcategory;
  int? _categoryId;

  List<SubcategoryEntity> get subcategories => _subcategories;
  bool get isLoading => _isLoading;
  String? get error => _error;
  SubcategoryEntity? get selectedSubcategory => _selectedSubcategory;
  int? get categoryId => _categoryId;

  Future<void> getSubcategories(int categoryId) async {
    _isLoading = true;
    _error = null;
    _categoryId = categoryId;
    notifyListeners();

    // Fake subcategories instead of API call
    if (categoryId == 1) {
      _subcategories = [
        SubcategoryEntity(
          title: 'subcategory_1_1',
          image: 'https://placehold.co/600x400/FF5722/FFFFFF/png',
        ),
        SubcategoryEntity(
          title: 'subcategory_1_2',
          image: 'https://placehold.co/600x400/3F51B5/FFFFFF/png',
        ),
        SubcategoryEntity(
          title: 'subcategory_1_3',
          image: 'https://placehold.co/600x400/4CAF50/FFFFFF/png',
        ),
      ];
    } else if (categoryId == 2) {
      _subcategories = [
        SubcategoryEntity(
          title: 'subcategory_2_1',
          image: 'https://placehold.co/600x400/9C27B0/FFFFFF/png',
        ),
        SubcategoryEntity(
          title: 'subcategory_2_2',
          image: 'https://placehold.co/600x400/00BCD4/FFFFFF/png',
        ),
      ];
    } else if (categoryId == 3) {
      _subcategories = [
        SubcategoryEntity(
          title: 'subcategory_3_1',
          image: 'https://placehold.co/600x400/8BC34A/000000/png',
        ),
        SubcategoryEntity(
          title: 'subcategory_3_2',
          image: 'https://placehold.co/600x400/FFC107/000000/png',
        ),
        SubcategoryEntity(
          title: 'subcategory_3_3',
          image: 'https://placehold.co/600x400/E91E63/FFFFFF/png',
        ),
      ];
    } else {
      _subcategories = [
        SubcategoryEntity(
          title: 'subcategory_other_1',
          image: 'https://placehold.co/600x400/607D8B/FFFFFF/png',
        ),
        SubcategoryEntity(
          title: 'subcategory_other_2',
          image: 'https://placehold.co/600x400/795548/FFFFFF/png',
        ),
      ];
    }

    if (_subcategories.isNotEmpty && _selectedSubcategory == null) {
      _selectedSubcategory = null; // default = show all
    }

    //  Either<DioException, List<SubcategoryEntity>> response = await subcategoryUseCase
    //     .getSubcategories(data);

    // response.fold((l) => showToast(l.message ?? "Error loading subcategories"), (r) {
    //   _subcategories.addAll(r);

    _isLoading = false;
    notifyListeners();
  }

  void selectSubcategory(SubcategoryEntity subcategory) {
    if (_selectedSubcategory?.title == subcategory.title) {
      _selectedSubcategory = null;
    } else {
      _selectedSubcategory = subcategory;
    }
    notifyListeners();
  }

  Future<void> refresh(int categoryId) async {
    _subcategories = [];
    _selectedSubcategory = null;
    _categoryId = null;
    await getSubcategories(categoryId);
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
