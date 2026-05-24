import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flouka/features/stores/domain/entity/store_details_entity.dart';
import 'package:flouka/features/stores/domain/use_case/store_use_case.dart';
import 'package:flouka/features/stores/presentation/pages/store_details_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/loading.dart';
import 'store_reviews_provider.dart';
import 'stores_product_provider.dart';

class StoreDetailsProvider extends ChangeNotifier {
  final StoreUseCase storeUseCase;
  StoreDetailsProvider(this.storeUseCase);
  StoreDetailsEntity? storeDetailsEntity;

  Future<void> getData(int id) async {
    AuthProvider authProvider = Provider.of<AuthProvider>(Constants.globalContext(), listen: false);
    Map<String,dynamic> data ={};
    data['store_id']  = id;
    data['lat']=authProvider.currentLocation?.latitude;
    data['lng']=authProvider.currentLocation?.longitude;
    var response = await storeUseCase.getStoreDetails(data);
    response.fold((l) {}, (r) {
      storeDetailsEntity = r;
    });
    notifyListeners();
  }

  Future<void> refresh(int id) async {
    storeDetailsEntity = null;
    await getData(id);
    notifyListeners();
  }

  void goToStoreDetailsPage(int id) {
    getData(id);
    Provider.of<StoresProductProvider>(Constants.globalContext(), listen: false).setStoreId(id);
    Provider.of<StoreReviewsProvider>(Constants.globalContext(), listen: false).setStoreId(id);
    navP(const StoreDetailsPage());
  }

  Future<void> follow(int id) async {
    loading();
    var response = await storeUseCase.follow(id);
    response.fold(
      (l) {
        showToast(l.toString());
      },
      (r) {
        this.storeDetailsEntity!.isFollowed = true;
        notifyListeners();
      },
    );
  }

  Future<void> unFollow(int id) async {
    loading();
    var response = await storeUseCase.unfollow(id);
    navPop();
    response.fold(
      (l) {
        showToast(l.toString());
      },
      (r) {
        this.storeDetailsEntity!.isFollowed = false;
        notifyListeners();
      },
    );
  }
}
