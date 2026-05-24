import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/features/filters/presentation/providers/brands_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/helper_function/navigation.dart';
import '../../../categories/presentation/providers/categories_provider.dart';
import '../../../filters/presentation/providers/category_attributes_provider.dart';
import '../pages/filter_page.dart';

class SearchFilterProvider extends ChangeNotifier {


  String? categoryId;
  String? subCategoryId;
  List<Map<String, dynamic>> mainFilters = [];
  List<Map<String, dynamic>> staticFilters = [];
  List<Map<String, dynamic>> apiFilters=[];

  initFilters(){
    CategoryProvider provider = Provider.of(Constants.globalContext(), listen: false);
    BrandsProvider brandsProvider = Provider.of(Constants.globalContext(), listen: false);
    staticFilters = [
      {
        'title': 'category',
        'on_tap':(){

        },
        'active':false,
        'value':null,
        'children':provider.CategoriesNames(),

      },{
        'title': 'sub_category',
        'on_tap':(){

        },
        'active':false,
        'value':null,
        'children':categoryId!=null? provider.SubCategoriesNames(categoryId:categoryId ):[],

      },{
        'title': 'brand',
        'on_tap':(){

        },
        'active':false,
        'value':null,
        'children':brandsProvider.BrandsNames(),

      },{
        'title':'price',
        'on_tap':(){

        },
        'active':false,
        'value':null,
      },
    ];
    mainFilters = [...staticFilters];
  }

  void goToFilterPage(){
    CategoryProvider provider = Provider.of(Constants.globalContext(), listen: false);
    BrandsProvider brandsProvider = Provider.of(Constants.globalContext(), listen: false);
    initFilters();
   navP(const FilterPage());
  }

  void addFilter(){
    CategoryAttributesProvider categoryAttributesProvider = Provider.of(Constants.globalContext(), listen: false);
    BrandsProvider brandsProvider = Provider.of(Constants.globalContext(), listen: false);
    mainFilters = [...staticFilters, ...apiFilters,];
    notifyListeners();

  }

  void setLabelValue(Map<String, dynamic> data, dynamic value) async{
    final index = mainFilters.indexWhere((e) => e['title'] == data['title']);

    if (index == -1) return;
    BrandsProvider brandsProvider = Provider.of<BrandsProvider>(Constants.globalContext(), listen: false,);
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(Constants.globalContext(), listen: false,);
    CategoryAttributesProvider categoryAttributesProvider = Provider.of(Constants.globalContext(), listen: false,);
    if(data['title'] == "category" || data['title'] == "sub_category"){
      for (var item in mainFilters[index]['children']) {
        item['active'] = false;
      }
      value['active'] = true;

      mainFilters[index]['value'] = value;
      mainFilters[index]['active'] = true;
    }else{
      List values = mainFilters[index]['value'] ?? [];

      final exists = values.any((e) => e['id'] == value['id']);

      if (exists) {
        values.removeWhere((e) => e['id'] == value['id']);
        value['active'] = false;
      } else {
        values.add(value);
        value['active'] = true;
      }

      mainFilters[index]['value'] = values;
    }

    if (data['title'] == "category") {
      categoryId = value['id'].toString();
      brandsProvider.setCategory(categoryId!);
      Map<String,dynamic> element = mainFilters.firstWhere((e) => e['title'] == 'sub_category');
      Map<String,dynamic> brandElement = mainFilters.firstWhere((e) => e['title'] == 'brand');
      brandElement['value'] = null;
      element['value'] = null;

      element['children'] = categoryProvider.SubCategoriesNames(categoryId: categoryId);
      await brandsProvider.setCategory(categoryId);
      mainFilters.firstWhere((e) => e['title'] == 'brand')['children'] = brandsProvider.BrandsNames();
      categoryAttributesProvider.clear();
      apiFilters=[];
      addFilter();
      notifyListeners();
    }else if(data['title'] == "sub_category"){
      subCategoryId = value['id'].toString();
      Map<String,dynamic> brandElement = mainFilters.firstWhere((e) => e['title'] == 'brand');
      brandElement['value'] = null;
      await brandsProvider.setCategory(subCategoryId!);
      mainFilters.firstWhere((e) => e['title'] == 'brand')['children'] = brandsProvider.BrandsNames();
      await categoryAttributesProvider.setCategory(subCategoryId!);
      addFilter();
    }
    notifyListeners();
  }

  String getFilterLabel(dynamic value) {
    if (value == null) return '';
    if (value is Map<String, dynamic>) {
      return value['name'] ?? '';
    }
    if (value is List) {
      return value
          .map((e) => e['name'].toString())
          .join(' , ');
    }
    return '';
  }

  void resetFilters(){
   for(var filter in mainFilters){
    filter['value'] = null;
    filter['active'] = false;
   }
   isChangedPrice=false;
   priceRange = const RangeValues(0, 20000);
   notifyListeners();
  }

  RangeValues? selectedPriceRange;
  RangeValues priceRange = const RangeValues(0, 20000);
  bool isChangedPrice=false;
  void selectPriceRange(RangeValues range) {
    selectedPriceRange = range;
    isChangedPrice=true;
    Map<String,dynamic> element= mainFilters.firstWhere((e) => e['title'] == 'price');
    element['value'] = {"name":"${range.start}  -  ${range.end}", "from":range.start,"to":range.end};
    notifyListeners();
  }

  Map<String, dynamic> getSelectedFilters() {
    Map<String, dynamic> filters = {};
    List<String> attributesIds = [];
    List<String> brandIds = [];
    for (var filter in mainFilters) {

      final title = filter['title'];
      final value = filter['value'];

      if (value == null) continue;

      // category / subcategory
      if (title == 'category' || title == 'sub_category') {

        if (value is Map<String, dynamic>) {
          if(title =="category"){
            filters["category_id"] = value['id'];
          }else{
            filters["category_id"] = value['id'];
          }
        }
        continue;
      } else if (value is List) {
        if(title == 'brand'){
          brandIds.addAll(
            value.map<String>((e) => e['id'].toString()).toList(),
          );
        }else{
          attributesIds.addAll(
            value.map<String>((e) => e['id'].toString()).toList(),
          );
        }
      }else if (value is Map<String, dynamic>) {
        if(title == 'brand'){
          brandIds.add(
            value['id'].toString(),
          );
        }else{
          attributesIds.add(
            value['id'].toString(),
          );
        }

    }
    // single object
    }
    filters['attributes_value_ids[]']=attributesIds;
    filters['brand_ids[]']=brandIds;
    return filters;
  }

}


// void setLabelValue(Map<String, dynamic> data, dynamic value) async{
//   final index = mainFilters.indexWhere((e) => e['title'] == data['title']);
//
//   if (index == -1) return;
//   BrandsProvider brandsProvider = Provider.of<BrandsProvider>(Constants.globalContext(), listen: false,);
//   CategoryProvider categoryProvider = Provider.of<CategoryProvider>(Constants.globalContext(), listen: false,);
//   CategoryAttributesProvider categoryAttributesProvider = Provider.of(Constants.globalContext(), listen: false,);
//   for (var item in mainFilters[index]['children']) {
//     item['active'] = false;
//   }
//   value['active'] = true;
//
//   mainFilters[index]['value'] = value;
//   mainFilters[index]['active'] = true;
//
//   if (data['title'] == "category") {
//     categoryId = value['id'].toString();
//     brandsProvider.setCategory(categoryId!);
//     Map<String,dynamic> element = mainFilters.firstWhere((e) => e['title'] == 'sub_category');
//     Map<String,dynamic> brandElement = mainFilters.firstWhere((e) => e['title'] == 'brand');
//     brandElement['value'] = null;
//     element['value'] = null;
//
//     element['children'] = categoryProvider.SubCategoriesNames(categoryId: categoryId);
//     await brandsProvider.setCategory(categoryId);
//     mainFilters.firstWhere((e) => e['title'] == 'brand')['children'] = brandsProvider.BrandsNames();
//     categoryAttributesProvider.clear();
//     apiFilters=[];
//     addFilter();
//     notifyListeners();
//   }else if(data['title'] == "sub_category"){
//     subCategoryId = value['id'].toString();
//     Map<String,dynamic> brandElement = mainFilters.firstWhere((e) => e['title'] == 'brand');
//     brandElement['value'] = null;
//     await brandsProvider.setCategory(subCategoryId!);
//     mainFilters.firstWhere((e) => e['title'] == 'brand')['children'] = brandsProvider.BrandsNames();
//     await categoryAttributesProvider.setCategory(subCategoryId!);
//     addFilter();
//   }
//   notifyListeners();
// }
