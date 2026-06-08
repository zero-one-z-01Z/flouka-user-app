import 'dart:async';
import 'dart:developer';

import 'package:flouka/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/pagination_class.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../categories/domain/entity/category_entity.dart';
import '../../../categories/presentation/providers/categories_provider.dart';
import '../../../categories/presentation/view/categories_view_all_page.dart';
import '../../domain/entity/product_entity.dart';
import '../../domain/user_case/product_use_case.dart';
import 'search_filter_provider.dart';

class CategoriesProductSearchProvider extends ChangeNotifier
    implements ProviderStructureModel<List<ProductEntity>>, PaginationClass{


 void goToCategoriesPage({required CategoryEntity category,bool isSubCategory = false}){
   if(isSubCategory && category.parentId != null){
     CategoryProvider provider = Provider.of(Constants.globalContext(), listen: false);
     this.category = provider.categories.firstWhere((element) => element.id == category.parentId);
     this.subcategory = category;
   }else{
     this.category = category;
   }
   refresh();
   SearchFilterProvider provider = Provider.of(Constants.globalContext(), listen: false);
   provider.initFilters();
   navP(const CategoriesViewAllPage());
 }

 void goToSearchPage({required int categoryId}){
   CategoryProvider categoryProvider = Provider.of(Constants.globalContext(), listen: false);
   if(categoryProvider.categories.any((element) => element.id==categoryId,)){
     this.category = categoryProvider.categories.firstWhere((element) => element.id==categoryId);
     this.categoryId=null;
   }else{
     this.category = null;
     this.subcategory = null;
     this.categoryId = categoryId;
   }
   refresh();
   SearchFilterProvider provider = Provider.of(Constants.globalContext(), listen: false);
   provider.initFilters();
   navP(const CategoriesViewAllPage());
 }



 final TextEditingController searchController = TextEditingController();

 CategoryEntity? category ;
 CategoryEntity? subcategory ;
 int? categoryId;
 final ProductUseCase productUseCase;
 CategoriesProductSearchProvider(this.productUseCase);
 Timer? _timer;

 void onTextChanged() {
   _timer?.cancel();
   _timer = Timer(const Duration(seconds: 1), () async {
     refresh();
     _timer?.cancel();
   });
 }

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

 void resetData(){
   categoryId =null;
   category = null;
   subcategory = null;
   inputs = null;
   SearchFilterProvider provider = Provider.of(Constants.globalContext(), listen: false);
   notifyListeners();

 }

 void selectCategory(CategoryEntity category) {
   if(category.id!=this.category?.id){
     this.category = category;
   }else{
     this.category = null;
   }
   this.subcategory = null;
   notifyListeners();
   CategoryProvider provider = Provider.of(Constants.globalContext(), listen: false);
   provider.notifyListeners();
   refresh();
 }

 void selectSubCategory(CategoryEntity category) {
   this.subcategory = category;
   notifyListeners();
   CategoryProvider provider = Provider.of(Constants.globalContext(), listen: false);
   provider.notifyListeners();
   refresh();
 }

 void clearSearch(){
   searchController.clear();
   category = null;
   subcategory = null;
   notifyListeners();
   goToPage();
 }
 bool fromFilter = false;
 void getProductsFromFilter(){
   fromFilter = true;
   refresh();
   navPop();
 }
 @override
 Future getData() async {
   Map<String, dynamic> dataToUse = {};
   dataToUse['page'] = pageIndex;
   if(fromFilter){
     SearchFilterProvider provider = Provider.of(Constants.globalContext(), listen: false);
     dataToUse=provider.getSelectedFilters();
   }else{
     if(categoryId !=null){
       dataToUse['category_id'] = categoryId;

     } else if(subcategory !=null || category !=null){
       dataToUse['category_id'] = subcategory !=null ? subcategory!.id : category?.id;
     }

     if(inputs!=null && inputs?['best_selling'] != null){
       dataToUse['best_selling'] = inputs?['best_selling'];
     }
     if(inputs!=null && inputs?['offer_products'] != null){
       dataToUse['offer_products'] = inputs?['offer_products'];
     }
     if(inputs!=null && inputs?['section_id'] != null){
       dataToUse['section_id'] = inputs?['section_id'];
     }

   }
   AuthProvider authProvider = Provider.of(Constants.globalContext(), listen: false);
   if(authProvider.currentLocation !=null){
     dataToUse['lat'] = authProvider.currentLocation?.latitude;
     dataToUse['lng'] = authProvider.currentLocation?.longitude;
   }
   if(searchController.text.isNotEmpty){
     dataToUse['search'] = searchController.text;
   }
   final result = await productUseCase.getProducts(dataToUse);
   log("${dataToUse}");
   result.fold((l) {
     log("${l.message}");
     showToast(l.message ?? "Error loading products");
   }, (r) {
     pageIndex++;
     data ??= [];
     data!.addAll(r);
     if (r.isEmpty) paginationFinished = true;
     notifyListeners();
   });

   paginationStarted = false;
   notifyListeners();
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
   refresh();
   SearchFilterProvider provider = Provider.of(Constants.globalContext(), listen: false);
   provider.initFilters();

   navP(const CategoriesViewAllPage(),then: (val){
     resetData();
   });

 }

}