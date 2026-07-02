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

  void clear(){
    categoryId;
    subCategoryId;
    mainFilters.clear();
    staticFilters.clear();
    apiFilters.clear();
  }

  initFilters(){
    CategoryProvider provider = Provider.of(Constants.globalContext(), listen: false);
    BrandsProvider brandsProvider = Provider.of(Constants.globalContext(), listen: false);
    brandsProvider.clear();
    clear();
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
   navP(const FilterPage());
  }

  void addFilter(){
    CategoryAttributesProvider categoryAttributesProvider = Provider.of(Constants.globalContext(), listen: false);
    BrandsProvider brandsProvider = Provider.of(Constants.globalContext(), listen: false);
    mainFilters = [...staticFilters, ...apiFilters,];
    notifyListeners();
  }

  Future<void> setLabelValue(
      Map<String, dynamic> data,
      dynamic value,
      ) async {
    final index = mainFilters.indexWhere(
          (e) => e['title'] == data['title'],
    );

    if (index == -1) return;

    final brandsProvider = Provider.of<BrandsProvider>(
      Constants.globalContext(),
      listen: false,
    );

    final categoryProvider = Provider.of<CategoryProvider>(
      Constants.globalContext(),
      listen: false,
    );

    final categoryAttributesProvider =
    Provider.of<CategoryAttributesProvider>(
      Constants.globalContext(),
      listen: false,
    );

    bool isUnSelected = false;

    /// Category & Sub Category (Single Selection + Toggle)
    if (data['title'] == "category" ||
        data['title'] == "sub_category") {
      final currentValue = mainFilters[index]['value'];

      /// Unselect same item
      if (currentValue != null &&
          currentValue['id'] == value['id']) {
        value['active'] = false;
        mainFilters[index]['active'] = false;
        mainFilters[index]['value'] = null;

        isUnSelected = true;
      } else {
        for (var item in mainFilters[index]['children'] ?? []) {
          item['active'] = false;
        }

        value['active'] = true;
        mainFilters[index]['active'] = true;
        mainFilters[index]['value'] = value;
      }
    }

    /// Multi Selection
    else {
      List values = List.from(
        mainFilters[index]['value'] ?? [],
      );

      final exists = values.any(
            (e) => e['id'] == value['id'],
      );

      if (exists) {
        values.removeWhere(
              (e) => e['id'] == value['id'],
        );
        value['active'] = false;
      } else {
        values.add(value);
        value['active'] = true;
      }

      mainFilters[index]['value'] = values;
      mainFilters[index]['active'] = values.isNotEmpty;
    }

    /// Category Unselected
    if (data['title'] == "category" && isUnSelected) {
      categoryId = null;
      subCategoryId = null;

      final subCategoryElement = mainFilters.firstWhere(
            (e) => e['title'] == 'sub_category',
      );

      final brandElement = mainFilters.firstWhere(
            (e) => e['title'] == 'brand',
      );

      for (var item in subCategoryElement['children'] ?? []) {
        item['active'] = false;
      }

      for (var item in brandElement['children'] ?? []) {
        item['active'] = false;
      }

      subCategoryElement['value'] = null;
      subCategoryElement['active'] = false;
      subCategoryElement['children'] = [];

      brandElement['value'] = null;
      brandElement['active'] = false;
      brandElement['children'] = [];

      brandsProvider.clear();
      categoryAttributesProvider.clear();

      apiFilters = [];
      addFilter();

      notifyListeners();
      return;
    }

    /// Sub Category Unselected
    if (data['title'] == "sub_category" && isUnSelected) {
      subCategoryId = null;

      final brandElement = mainFilters.firstWhere(
            (e) => e['title'] == 'brand',
      );

      for (var item in brandElement['children'] ?? []) {
        item['active'] = false;
      }

      brandElement['value'] = null;
      brandElement['active'] = false;
      brandElement['children'] = [];

      categoryAttributesProvider.clear();

      apiFilters = [];
      addFilter();

      notifyListeners();
      return;
    }

    /// Category Selected
    if (data['title'] == "category") {
      categoryId = value['id'].toString();

      final subCategoryElement = mainFilters.firstWhere(
            (e) => e['title'] == 'sub_category',
      );

      final brandElement = mainFilters.firstWhere(
            (e) => e['title'] == 'brand',
      );

      for (var item in subCategoryElement['children'] ?? []) {
        item['active'] = false;
      }

      for (var item in brandElement['children'] ?? []) {
        item['active'] = false;
      }

      subCategoryElement['value'] = null;
      subCategoryElement['active'] = false;
      subCategoryElement['children'] =
          categoryProvider.SubCategoriesNames(
            categoryId: categoryId,
          );

      brandElement['value'] = null;
      brandElement['active'] = false;
      brandElement['children'] = null;

      brandsProvider.clear();

      await brandsProvider.setCategory(categoryId!);

      brandElement['children'] =
          brandsProvider.BrandsNames();

      categoryAttributesProvider.clear();

      apiFilters = [];
      addFilter();
    }

    /// Sub Category Selected
    else if (data['title'] == "sub_category") {
      subCategoryId = value['id'].toString();

      final brandElement = mainFilters.firstWhere(
            (e) => e['title'] == 'brand',
      );

      for (var item in brandElement['children'] ?? []) {
        item['active'] = false;
      }

      brandElement['value'] = null;
      brandElement['active'] = false;

      await brandsProvider.setCategory(
        subCategoryId!,
      );

      brandElement['children'] =
          brandsProvider.BrandsNames();

      await categoryAttributesProvider.setCategory(
        subCategoryId!,
      );

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
    element['value'] = {"name":"${range.start.toStringAsFixed(2)}  -  ${range.end.toStringAsFixed(2)}", "from":range.start,"to":range.end};
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
            value
                .where((e) => e['id'] != null)
                .map<String>((e) => e['id'].toString())
                .toList(),
          );
        }else{
          attributesIds.addAll(
            value
                .where((e) => e['id'] != null)
                .map<String>((e) => e['id'].toString())
                .toList(),
          );
        }
      }else if (value is Map<String, dynamic>) {
        if (value['id'] == null) continue;

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
    if(attributesIds.isNotEmpty){
      filters['attributes_value_ids[]']=attributesIds;
    }
    if(brandIds.isNotEmpty){
      filters['brand_ids[]']=brandIds;
    }
    return filters;
  }


}
