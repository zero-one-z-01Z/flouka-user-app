import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/stores/domain/entity/store_details_entity.dart';
import 'package:flouka/features/stores/domain/use_case/store_use_case.dart';
import 'package:flouka/features/stores/presentation/pages/store_details_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/loading.dart';

class StoreDetailsProvider extends ChangeNotifier {
  final StoreUseCase storeUseCase;
  StoreDetailsProvider(this.storeUseCase);
  StoreDetailsEntity? storeDetailsEntity;

  Future<void> getData(int id) async {
    var response = await storeUseCase.getStoreDetails(id);
    response.fold((l) {}, (r) {
      storeDetailsEntity = r;
    });
  }

  Future<void> refresh(int id) async {
    storeDetailsEntity = null;
    await getData(id);
    notifyListeners();
  }

  void goToStoreDetailsPage(int id) {
    getData(id);
    navP(const StoreDetailsPage());
  }

  Future<void> follow(int id) async {
    loading();
    var response = await storeUseCase.follow(id);
    response.fold((l) {
      showToast(l.toString());
    }, (r) 
    {
      this.storeDetailsEntity!.isFollowed = true;
      notifyListeners();
    });
  }

  Future<void> unFollow(int id) async {
    var response = await storeUseCase.unfollow(id);
    response.fold((l) {
      showToast(l.toString());
    }, (r) {
      this.storeDetailsEntity!.isFollowed = false;
      notifyListeners();
    });
  }
}
