import 'package:flutter/material.dart';

class BrandProvider extends ChangeNotifier {
  final List<String> _brands = [
    'Apple',
    'Asus',
    'Acer',
    'Dell',
    'HP',
    'Huawei',
    'Lenovo',
    'Microsoft',
    'MSI',
    'Samsung',
    'Xiaomi',
  ];

  List<String> get brands {
    final sorted = [..._brands]
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    return List.unmodifiable(sorted);
  }

  // Selected brands (for filter page)
  final Set<String> _selectedBrands = {};

  Set<String> get selectedBrands => _selectedBrands;

  bool isSelected(String brand) => _selectedBrands.contains(brand);

  void toggleBrand(String brand) {
    if (_selectedBrands.contains(brand)) {
      _selectedBrands.remove(brand);
    } else {
      _selectedBrands.add(brand);
    }
    notifyListeners();
  }

  void clearSelected() {
    _selectedBrands.clear();
    notifyListeners();
  }

  Map<String, List<String>> get groupedBrands {
    final Map<String, List<String>> map = {};
    final sorted = [..._brands]
      ..sort((a, b) => a.toLowerCase().compareTo(b.toLowerCase()));
    for (final brand in sorted) {
      if (brand.isEmpty) continue;
      final letter = brand[0].toUpperCase();
      map.putIfAbsent(letter, () => []);
      map[letter]!.add(brand);
    }
    final sortedKeys = map.keys.toList()..sort();
    return {for (final k in sortedKeys) k: map[k]!};
  }
}
