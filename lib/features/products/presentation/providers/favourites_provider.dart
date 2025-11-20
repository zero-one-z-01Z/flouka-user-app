import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _favorites = [];

  List<Map<String, dynamic>> get favorites => _favorites;

  void toggleFavorite(Map<String, dynamic> product) {
    final index = _favorites.indexWhere((p) => p['id'] == product['id']);
    if (index != -1) {
      _favorites.removeAt(index);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  bool isFavorite(Map<String, dynamic> product) {
    return _favorites.any((p) => p['id'] == product['id']);
  }

  void clearFavorites() {
    _favorites.clear();
    notifyListeners();
  }
}
