import 'dart:developer';

import 'package:flouka/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/pagination_class.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../../categories/domain/entity/category_entity.dart';
import '../../../categories/presentation/providers/categories_provider.dart';
import '../../../categories/presentation/view/categories_view_all_page.dart';
import '../../domain/entity/product_entity.dart';
import '../../domain/user_case/product_use_case.dart';

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
   navP(const CategoriesViewAllPage());
 }



 CategoryEntity? category ;
 CategoryEntity? subcategory ;
 final ProductUseCase productUseCase;
 CategoriesProductSearchProvider(this.productUseCase);

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
   inputs = null;
   pageIndex = 1;
   paginationFinished = false;
   paginationStarted = false;
 }

 void selectCategory(CategoryEntity category) {
   this.category = category;
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


 @override
 Future getData() async {
   Map<String, dynamic> dataToUse = {
     'page': pageIndex, 'category_id':subcategory !=null ? subcategory!.id : category?.id,
   };

   final result = await productUseCase.getProducts(dataToUse);
   log("${dataToUse}");
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

 }

}