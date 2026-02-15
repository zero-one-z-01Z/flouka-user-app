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

  final List<FilterEntity> filters = [
    const FilterEntity(id: -1, title: 'For You'),
    const FilterEntity(id: 0, title: 'New Gadget'),
  ];

  late FilterEntity selectedFilter = filters.first;

  void setSelectedIndex(FilterEntity filter) {
    selectedFilter = filter;
    notifyListeners();
  }

  bool isSelected(FilterEntity filter) {
    return selectedFilter.id == filter.id;
  }
}
