import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flouka/core/dialog/snack_bar.dart';
import 'package:flouka/core/models/pagination_class.dart';
import 'package:flouka/core/models/provider_structure_model.dart';
import 'package:flouka/features/products/domain/user_case/product_use_case.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../pages/recommended_products_page.dart';

class RecommendProductsProvider extends ChangeNotifier
    implements ProviderStructureModel<List<ProductEntity>>, PaginationClass {
  final ProductUseCase productUseCase;
  RecommendProductsProvider(this.productUseCase);

  String title = 'recommended';

  @override
  List<ProductEntity>? data;

  @override
  Map? inputs;

  @override
  int pageIndex = 1;

  @override
  bool paginationFinished = false;

  @override
  bool paginationStarted = false;

  int? selectedCategoryId;
  String? searchQuery;

  ScrollController controller = ScrollController();

  @override
  void clear() {
    data = null;
    pageIndex = 1;
    paginationFinished = false;
    paginationStarted = false;
    notifyListeners();
  }

  @override
  Future getData() async {
    Map<String, dynamic> dataToUse = {
      'page': pageIndex,
    };
    AuthProvider authProvider = Provider.of(Constants.globalContext(), listen: false);
    if(authProvider.currentLocation !=null){
      dataToUse['lat'] = authProvider.currentLocation?.latitude;
      dataToUse['lng'] = authProvider.currentLocation?.longitude;
    }
    final result;
    if(inputs!=null){
      dataToUse.addAll(inputs! as Map<String,dynamic>);
    }
    if((inputs?.containsKey('popular_category_id')??false)||(inputs?.containsKey('section_id')??false)){
      result = await productUseCase.getProducts(dataToUse);
    }else{
      result = await productUseCase.getRecommended(dataToUse);
    }

    result.fold((l) => showToast(l.message ?? "Error loading products"), (r) {
      pageIndex++;
      data ??= [];
      data!.addAll(r);
      if (r.isEmpty) paginationFinished = true;
      notifyListeners();
    });

    paginationStarted = false;
    notifyListeners();
  }

  List<ProductEntity> recommendedHomeList=[];

  Future getRecommendedHomeData() async {
    Map<String, dynamic> dataToUse = {
      'page': 1,
    };
    if(inputs!=null){
      dataToUse.addAll(inputs! as Map<String,dynamic>);
    }
    AuthProvider authProvider = Provider.of(Constants.globalContext(), listen: false);
    if(authProvider.currentLocation !=null){
      dataToUse['lat'] = authProvider.currentLocation?.latitude;
      dataToUse['lng'] = authProvider.currentLocation?.longitude;
    }

    final result = await productUseCase.getRecommended(dataToUse);
    result.fold((l) => showToast(l.message ?? "Error loading products"), (r) {
      recommendedHomeList = [];
      recommendedHomeList.addAll(r);
      notifyListeners();
    });
  }


  @override
  void pagination() {
    controller.addListener(() async {
      if (controller.position.atEdge && controller.position.pixels > 50) {
        if (!paginationFinished &&
            !paginationStarted &&
            (data?.isNotEmpty ?? false)) {
          paginationStarted = true;
          await getData();
        }
      }
    });
  }

  @override
  Future refresh() async {
    clear();
    await getData();
  }

  @override
  void goToPage([Map<String, dynamic>? inputs]) {
    this.inputs = inputs;
    title = inputs?['title']??"recommended";
    refresh();
    navP(const RecommendedProductsPage());
  }

}
