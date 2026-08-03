import 'dart:math';
import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flouka/core/models/provider_structure_model.dart';
import 'package:flouka/features/products/domain/user_case/product_use_case.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../auth/presentation/providers/auth_provider.dart';

class BestProductsProvider extends ChangeNotifier
    implements ProviderStructureModel<List<ProductEntity>> {
  final ProductUseCase productUseCase;
  BestProductsProvider(this.productUseCase);

  @override
  List<ProductEntity>? data;

  @override
  Map? inputs;





  @override
  void clear() {
    data = null;
    inputs = null;
  }


  @override
  Future getData() async {
    try{
      print('best_selling');
      final random = Random();
      final int key = 100000 + random.nextInt(900000);
      Map<String, dynamic> dataToUse = {
        'page': 1,
        'seed': key,
        'best_selling':1,
      };
      print('best_selling');
      AuthProvider authProvider = Provider.of(Constants.globalContext(), listen: false);
      if(authProvider.currentLocation !=null){
        dataToUse['lat'] = authProvider.currentLocation?.latitude;
        dataToUse['lng'] = authProvider.currentLocation?.longitude;
      }
      final result = await productUseCase.getProducts(dataToUse);
      result.fold((l) => null, (r) {
        print('best_selling');
        print(r);
        data ??= [];
        data!.addAll(r);
        notifyListeners();
      });
      notifyListeners();
    }catch(e,l){
      print(l);
      print(e);
    }
  }



  @override
  Future refresh() async {
    clear();
    await getData();
  }

  @override
  void goToPage([Map<String, dynamic>? inputs]) {

  }
}
