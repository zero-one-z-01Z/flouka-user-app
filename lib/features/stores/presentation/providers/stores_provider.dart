import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/stores/presentation/pages/store_details_page.dart';
import 'package:flutter/material.dart';

import '../widgets/stores_container_home_widget.dart';

class StoresProvider with ChangeNotifier {
  StoresProvider();

  // Fake data for home section
  final List<StoreEntity> _stores = [
    const StoreEntity(
      imageUrl: 'https://picsum.photos/310',
      name: 'Tech World',
      description: 'Latest gadgets and electronics.',
      rating: 4.7,
    ),
    const StoreEntity(
      imageUrl: 'https://picsum.photos/311',
      name: 'Fashion Hub',
      description: 'Trendy clothes and accessories.',
      rating: 4.3,
    ),
    const StoreEntity(
      imageUrl: 'https://picsum.photos/312',
      name: 'Home Essentials',
      description: 'Everything your home needs.',
      rating: 4.5,
    ),
    const StoreEntity(
      imageUrl: 'https://picsum.photos/313',
      name: 'Sports Zone',
      description: 'Sports gear and equipment.',
      rating: 4.2,
    ),
  ];

  List<StoreEntity> get stores => _stores;

  void goToStoreDetailsPage() {
    navP(const StoreDetailsPage());
  }

  int current = 0;

  void changeCurrent(int index) async {
    if (current == index) return;
    current = index;
    notifyListeners();
  }
}
