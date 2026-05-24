import 'package:flouka/core/helper_function/loading.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/core/models/provider_structure_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../products/presentation/providers/search_filter_provider.dart';
import '../../domain/entity/brand_entity.dart';
import '../../domain/use_case/filter_use_case.dart';

class BrandsProvider extends ChangeNotifier implements ProviderStructureModel<List<BrandEntity>>{

  final FilterUseCase filterUseCase;
  BrandsProvider(this.filterUseCase);

  @override
  List<BrandEntity>? data;

  @override
  Map? inputs;

  String? categoryId;
  @override
  void clear() {
    data = null;
    notifyListeners();
  }

  List<Map<String,dynamic>> BrandsNames(){
    return List.generate(data?.length??0, (index){
      return {'name':data![index].name,'id':data![index].id};
    });
  }

  @override
  Future getData() async {
    Map<String, dynamic> dataToUse = {
      'category_id': categoryId,
    };

    final result = await filterUseCase.getCategoryBrands(dataToUse);
    result.fold((l) => showToast(l.message ?? "Error loading products"), (r) {
      data= r;
      SearchFilterProvider searchFilterProvider = Provider.of<SearchFilterProvider>(Constants.globalContext(),listen: false);
      searchFilterProvider.mainFilters.firstWhere((element) => element['title']=='brand',)['children'] = data;
      notifyListeners();
    });

  }

  @override
  Future refresh() async {
    clear();
    await getData();
  }

  @override
  void goToPage([Map<String, dynamic>? inputs]) {

  }

  Future setCategory(String? categoryId) async {
    this.categoryId = categoryId;
    loading();
    await refresh();
    navPop();
  }
}