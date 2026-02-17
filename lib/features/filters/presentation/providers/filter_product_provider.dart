import 'package:flutter/material.dart';

import '../../../products/domain/entity/product_entity.dart';
import '../../domain/entity/filter_entity.dart';
import '../../domain/use_case/filter_use_case.dart';

class FilterProductProvider extends ChangeNotifier {
  final FilterUseCase filterUseCase;
  FilterProductProvider(this.filterUseCase);
  List<FilterEntity>? data;

  Future<void> getData() async {
    var response = await filterUseCase.getFilters();
    response.fold((l) {}, (r) {
      data = r;
      filters.addAll(r);
      getFilterProducts(filters.first.id);
    });
  }

  bool isProductLoading = false;
  List<ProductEntity>? products;

  Future<void> getFilterProducts(int id) async {
    isProductLoading = true;
    notifyListeners();
    var response = await filterUseCase.getFiltersProducts(id);
    response.fold((l) {}, (r) {
      products = r;
    });
    isProductLoading = false;
    notifyListeners();
  }

  final List<FilterEntity> filters = [];

  late FilterEntity selectedFilter = filters.first;

  void setSelectedIndex(FilterEntity filter) {
    selectedFilter = filter;
    notifyListeners();
  }

  bool isSelected(FilterEntity filter) {
    return selectedFilter.id == filter.id;
  }

  bool get isLoading => isProductLoading;

  ProductEntity fakeProduct = ProductEntity(
    id: -1,
    title: 'Loading Product Title...',
    description: 'Loading Description...',
    price: 99.99,
    offerPrice: 0,
    image: '',
    avgRating: 4.5,
    isFavorite: false,
  );
}
