import 'package:flutter/material.dart';
import '../../domain/entity/category_entity.dart';
import '../../domain/usecases/category_usecase.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryUsecase categoryUseCases;

  CategoryProvider(this.categoryUseCases);

  List<CategoryEntity> _categories = [];
  List<CategoryEntity> _popularCategories = [];
  bool _isLoading = false;
  String? _error;
  CategoryEntity? _selectedCategory;

  List<CategoryEntity> get categories => _categories;
  List<CategoryEntity> get popularCategories => _popularCategories;
  bool get isLoading => _isLoading;
  String? get error => _error;
  CategoryEntity? get selectedCategory => _selectedCategory;

  Future<void> getCategories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    // Fake categories instead of API call
    _categories = [
      CategoryEntity(
        id: 1,
        image: 'https://placehold.co/600x400/000000/FFFFFF/png',
        name: 'category_1',
      ),
      CategoryEntity(
        id: 2,
        image: 'https://placehold.co/600x400/FFFFFF/000000/png',
        name: 'category_2',
      ),
      CategoryEntity(
        id: 3,
        image: 'https://placehold.co/600x400/0000FF/FFFFFF/png',
        name: 'category_3',
      ),
      CategoryEntity(
        id: 4,
        image: 'https://placehold.co/600x400/FFFF00/000000/png',
        name: 'category_4',
      ),
      CategoryEntity(
        id: 5,
        image: 'https://placehold.co/600x400/FFFF011/000000/png',
        name: 'category_5',
      ),
      CategoryEntity(
        id: 6,
        image: 'https://placehold.co/600x400/FFFF011/000000/png',
        name: 'category_6',
      ),
    ];

    if (_categories.isNotEmpty && _selectedCategory == null) {
      _selectedCategory = null; // default = show all
    }

    //  Either<DioException, List<BannersEntity>> response = await bannersUseCase
    //     .getBanners(data);

    // response.fold((l) => showToast(l.message ?? "Error loading banners"), (r) {
    //   bannersList.addAll(r);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getPopularCategories() async {
    // Fake popular categories instead of API call
    _popularCategories = [
      CategoryEntity(
        id: 101,
        image: 'https://placehold.co/600x400/FF5722/FFFFFF/png',
        name: 'popular_1',
      ),
      CategoryEntity(
        id: 102,
        image: 'https://placehold.co/600x400/3F51B5/FFFFFF/png',
        name: 'popular_2',
      ),
      CategoryEntity(
        id: 103,
        image: 'https://placehold.co/600x400/4CAF50/FFFFFF/png',
        name: 'popular_3',
      ),
      CategoryEntity(
        id: 104,
        image: 'https://placehold.co/600x400/FFC107/000000/png',
        name: 'popular_4',
      ),
    ];

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
