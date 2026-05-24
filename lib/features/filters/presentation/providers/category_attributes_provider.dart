import 'package:flouka/core/helper_function/loading.dart';
import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/core/models/provider_structure_model.dart';
import 'package:flouka/features/filters/domain/entity/category_attributes_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../products/presentation/providers/search_filter_provider.dart';
import '../../domain/use_case/filter_use_case.dart';

class CategoryAttributesProvider extends ChangeNotifier implements ProviderStructureModel<List<CategoryAttributesEntity>>{

  final FilterUseCase filterUseCase;
  CategoryAttributesProvider(this.filterUseCase);

  @override
  List<CategoryAttributesEntity>? data;

  @override
  Map? inputs;

  String? categoryId;
  @override
  void clear() {
    data = null;
    notifyListeners();
  }

  @override
  Future getData() async {
    Map<String, dynamic> dataToUse = {
      'category_id': categoryId,
    };

    final result = await filterUseCase.getCategoryAttributes(dataToUse);
    result.fold((l) => showToast(l.message ?? "Error loading products"), (r) {
      data= r;
      addFilter();
      notifyListeners();
    });

  }

  List<Map<String,dynamic>> CategoryAttributesNames(int index){
    if(data ==null || (data!=null && data!.isEmpty)){
      return [];
    }
    return List.generate(data![index].values.length, (i){
      return {'name':data![index].values[i].value,'id':data![index].values[i].id};
    });
  }

  void addFilter(){
    SearchFilterProvider searchFilterProvider =Provider.of<SearchFilterProvider>(Constants.globalContext(),listen: false);
    searchFilterProvider.apiFilters = [];
    print('${searchFilterProvider.apiFilters}');
    for(int i=0;i<(data?.length??0);i++){
     searchFilterProvider.apiFilters.add(
       {
         'title': data![i].name,
         'on_tap':(){

         },
         'active':false,
         'value':null,
         'children':CategoryAttributesNames(i),
       }
     );
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

  Future setCategory(String? categoryId) async {
    this.categoryId = categoryId;
    loading();
    await refresh();
    navPop();
  }
}