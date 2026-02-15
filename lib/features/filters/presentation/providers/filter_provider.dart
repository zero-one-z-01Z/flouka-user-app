import 'package:flutter/material.dart';

import '../../domain/entity/filter_entity.dart';
import '../../domain/use_case/filter_use_case.dart';

class FilterProvider extends ChangeNotifier {
  final FilterUseCase filterUseCase;
  FilterProvider({required this.filterUseCase});
  List<FilterEntity>? data;

  Future<void> getData() async {
    var response = await filterUseCase.getFilters();
    response.fold((l) {}, (r) {
      data = r;
    });
  }

  final List<String> filters = const [
    'For You',
    'New Gadget',
    'Best Silling',
    'Computer',
    'Mobile',
  ];

  int selectedIndex = 0;

  void setSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
