import 'package:flutter/material.dart';
import '../../domain/entity/category_entity.dart';
import '../../domain/usecases/category_usecase.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryUsecase categoryUseCases;

  CategoryProvider(this.categoryUseCases);
  List<CategoryEntity> _categories = [];
  CategoryEntity? _selectedCategory;

  List<CategoryEntity> get categories => _categories;
  CategoryEntity? get selectedCategory => _selectedCategory;

 
  Future<void> getCategories() async {
    notifyListeners();

    // Fake categories instead of API call
    _categories = [
      CategoryEntity(
        id: 1,
        image: 'https://placehold.co/600x400/000000/FFFFFF/png',
        name: 'category_1',
        subCategories: [],
      ),
      CategoryEntity(
        id: 2,
        image: 'https://placehold.co/600x400/FFFFFF/000000/png',
        name: 'category_2',
        subCategories: [],
      ),
      CategoryEntity(
        id: 3,
        image: 'https://placehold.co/600x400/0000FF/FFFFFF/png',
        name: 'category_3',
        subCategories: [],
      ),
      CategoryEntity(
        id: 4,
        image: 'https://placehold.co/600x400/FFFF00/000000/png',
        name: 'category_4',
        subCategories: [],
      ),
      CategoryEntity(
        id: 5,
        image: 'https://placehold.co/600x400/FFFF011/000000/png',
        name: 'category_5',
        subCategories: [],
      ),
      CategoryEntity(
        id: 6,
        image: 'https://placehold.co/600x400/FFFF011/000000/png',
        name: 'category_6',
        subCategories: [],
      ),
    ];

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
