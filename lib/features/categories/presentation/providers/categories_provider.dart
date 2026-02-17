import 'package:flouka/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import '../../domain/entity/category_entity.dart';
import '../../domain/usecases/category_usecase.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryUsecase categoryUseCases;

  CategoryProvider(this.categoryUseCases);
  List<CategoryEntity> _categories = [];
  final List<CategoryEntity> _popularCategories = [];
  CategoryEntity? _selectedCategory;

  List<CategoryEntity> get categories => _categories;
  List<CategoryEntity> get popularCategories => _popularCategories;
  CategoryEntity? get selectedCategory => _selectedCategory;

  List<CategoryEntity> homeCategories = [
    CategoryEntity(
      id: 1,
      image: AppImages.offer,
      name: 'offers_products',
      subCategories: [],
    ),
    CategoryEntity(
      id: 2,
      image: AppImages.bestSeller,
      name: 'best_sellers',
      subCategories: [],
    ),
    CategoryEntity(
      id: 3,
      image: AppImages.categories,
      name: 'categories',
      subCategories: [],
    ),
    CategoryEntity(
      id: 4,
      image: AppImages.exploreCategories,
      name: 'explore',
      subCategories: [],
    ),
  ];

  Future<void> getCategories() async {
    notifyListeners();

    // Fake categories instead of API call
    _categories = [
      CategoryEntity(
        subCategories: [],
        id: 1,
        image: 'https://placehold.co/600x400/000000/FFFFFF/png',
        name: 'category_1',
      ),
      CategoryEntity(
        subCategories: [],
        id: 2,
        image: 'https://placehold.co/600x400/FFFFFF/000000/png',
        name: 'category_2',
      ),
      CategoryEntity(
        subCategories: [],
        id: 3,
        image: 'https://placehold.co/600x400/0000FF/FFFFFF/png',
        name: 'category_3',
      ),
      CategoryEntity(
        subCategories: [],
        id: 4,
        image: 'https://placehold.co/600x400/FFFF00/000000/png',
        name: 'category_4',
      ),
      CategoryEntity(
        subCategories: [],
        id: 5,
        image: 'https://placehold.co/600x400/FFFF011/000000/png',
        name: 'category_5',
      ),
      CategoryEntity(
        subCategories: [],
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
