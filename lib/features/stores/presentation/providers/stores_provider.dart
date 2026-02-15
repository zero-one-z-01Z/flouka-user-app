import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/stores/presentation/pages/store_details_page.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/store_entity.dart';
import '../../domain/use_case/store_use_case.dart';

class StoresProvider with ChangeNotifier {
  final StoreUseCase storeUseCase;
  StoresProvider(this.storeUseCase);

  List<StoreEntity>? stores;
  void goToStoreDetailsPage() {
    navP(const StoreDetailsPage());
  }

  Future<void> getData() async {
    var response = await storeUseCase.getStores();
    response.fold((l) {}, (r) {
      stores = r;
      notifyListeners();
    });
  }

  int current = 0;

  void changeCurrent(int index) async {
    if (current == index) return;
    current = index;
    notifyListeners();
  }
}
