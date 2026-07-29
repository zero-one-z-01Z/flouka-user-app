import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/core/dialog/confirm_dialog.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/auth/presentation/providers/auth_provider.dart';
import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flouka/features/stores/domain/entity/store_details_entity.dart';
import 'package:flouka/features/stores/domain/use_case/store_use_case.dart';
import 'package:flouka/features/stores/presentation/pages/store_details_page.dart';
import 'package:flouka/features/stores/presentation/providers/stores_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/dialog/guest_dialog.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/dialog/success_dialog.dart';
import '../../../../core/helper_function/loading.dart';
import '../../../stories/presentation/provider/story_provider.dart';
import 'store_reviews_provider.dart';
import 'stores_product_provider.dart';

enum ProductMenuAction {
  report,
  blockVendor,
}

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
    notifyListeners();
    await getData(id);
  }

  void goToStoreDetailsPage(int id) {
    getData(id);
    Provider.of<StoresProductProvider>(Constants.globalContext(), listen: false).setStoreId(id);
    Provider.of<StoreReviewsProvider>(Constants.globalContext(), listen: false).setStoreId(id);
    navP(const StoreDetailsPage());
  }

  Future<void> updateFollow(int id) async {
    loading();
    Map<String,dynamic> data ={};
    data['type']  = "vendor";
    data['id']  = id;
    var response = await storeUseCase.updateFollow(data);
    navPop();
    response.fold(
      (l) {
        showToast(l.toString());
      },
      (r) {
        this.storeDetailsEntity!.isFollowed = !this.storeDetailsEntity!.isFollowed;
        notifyListeners();
      },
    );
  }

  void confirmBlock({required int vendorId})async{
    if (!AuthProvider.isLogin())
    {
      showGuestDialog();
      return;
    }
    confirmDialog(LanguageProvider.translate('warning', 'block_title'), LanguageProvider.translate('buttons', 'confirm'), (){
      navPop();
      createBlock(vendorId: vendorId);
    });
  }
  Future createBlock({required int vendorId}) async {

    Map<String,dynamic> data ={};
    data['vendor_id'] = vendorId;
    loading();
    Either<DioException, bool> response = await storeUseCase.createBlock(data);
    navPop();
    response.fold((l) {
    }, (r) {

      successDialog(then: (){
        navPop();
      });
      Constants.globalContext().read<StoresProvider>().removeVendor(vendorId);
      Constants.globalContext().read<StoryProvider>().removeVendor(vendorId);

      notifyListeners();
    });
  }

}
