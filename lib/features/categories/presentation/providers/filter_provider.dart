import 'package:flutter/material.dart';

class FilterProvider extends ChangeNotifier {
  final List<String> _filters = [
    'All',
    'Popular',
    'Newest',
    'Price: Low to High',
    'Price: High to Low',
  ];

  bool _isLoading = false;
  String? _error;
  String _selectedFilter = 'All';

  List<String> get filters => _filters;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String get selectedFilter => _selectedFilter;

  Future<void> getFilters() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    // Fake filters instead of API call
    await Future.delayed(const Duration(milliseconds: 200));

    _isLoading = false;
    notifyListeners();
  }

  void selectFilter(String filter) {
    if (_selectedFilter == filter) {
      _selectedFilter = 'All';
    } else {
      _selectedFilter = filter;
    }
    notifyListeners();
  }

  Future<void> refresh() async {
    _selectedFilter = 'All';
    await getFilters();
  }

  void clear() {
    _selectedFilter = 'All';
    _error = null;
    _isLoading = false;
    notifyListeners();
  }
}
