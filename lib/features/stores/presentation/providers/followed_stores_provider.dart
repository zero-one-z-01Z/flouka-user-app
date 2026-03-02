import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/store_entity.dart';
import '../../domain/use_case/store_use_case.dart';
import '../pages/followed_store_view.dart';

class FollowedStoresProvider with ChangeNotifier {
  final StoreUseCase storeUseCase;
  FollowedStoresProvider(this.storeUseCase);

  List<StoreEntity>? stores;
  void goToStoreDetailsPage() {
    navP(const FollowedStoreView());
  }

  Future<void> getData() async {
    var response = await storeUseCase.getFollowedStores();
    response.fold((l) {}, (r) {
      stores = r;
      notifyListeners();
    });
  }

  clear() {
    stores = [];
  }

  void goToPage() {
    refresh();
    navP(const FollowedStoreView());
  }

  refresh() async {
    clear();
    await getData();
  }
}
