// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:raval/core/models/drop_down_class.dart';
// import 'package:raval/core/models/pagination_class.dart';
// import 'package:raval/features/category/domain/entity/category_entity.dart';
// import 'package:raval/features/category/presentation/providers/category_provider.dart';
// import 'package:raval/features/nav_bar/presentation/providers/nav_bar_provider.dart';
// import 'package:raval/features/products/domain/entity/product_entity.dart';
// import 'package:raval/features/products/domain/user_case/product_use_case.dart';
// import 'package:raval/features/products/presentation/providers/colors_provider.dart';
// import 'package:raval/features/settings/presentation/provider/settings_provider.dart';
// import '../../../../core/constants/constants.dart';
// import '../../../../core/dialog/snack_bar.dart';
// import '../../../../core/helper_function/navigation.dart';
// import '../../../../core/models/provider_structure_model.dart';
// import '../views/filter_products_view.dart';

// class FilterProductsProvider extends ChangeNotifier
//     implements ProviderStructureModel<List<ProductEntity>>, DropDownClass, PaginationClass {
//   @override
//   List<ProductEntity>? data;

//   @override
//   Map? inputs;

//   final ProductUseCase productUseCase;

//   FilterProductsProvider(this.productUseCase);

//   CategoryEntity? selectedCategory;
//   CategoryEntity? selectedSubCategory;
//   RangeValues? selectedPriceRange;
//   List<String>? selectedColors;
//   List<String>? selectedSizes;

//   /// Internal filters map
//   final Map<String, dynamic> _filters = {};

//   @override
//   void clear() {
//     data = null;
//     inputs = null;
//     Provider.of<CategoryProvider>(Constants.globalContext(),listen: false).selectedEntity =null;
//     Provider.of<CategoryProvider>(Constants.globalContext(),listen: false).selectedSubCategory =null;

//     selectedCategory = null;
//     selectedSubCategory = null;
//     selectedPriceRange = null;
//     selectedColors = null;
//     selectedSizes = null;
//     _filters.clear();
//   }

//   /// Save current selections into filters
//   void saveFilters() {
//     _filters.clear();
//     if (selectedCategory != null) {
//       _filters['category_id'] = selectedCategory!.id;
//     }
//     if (selectedSubCategory != null) {
//       _filters['category_id'] = selectedSubCategory!.id;
//     }
//     if (selectedPriceRange != null) {
//       _filters['min_price'] = selectedPriceRange!.start;
//       _filters['max_price'] = selectedPriceRange!.end;
//     }
//     if (selectedColors != null && selectedColors!.isNotEmpty) {
//       _filters['color_ids[]'] = selectedColors;
//     }
//     if (selectedSizes != null && selectedSizes!.isNotEmpty) {
//       _filters['size_ids[]'] = selectedSizes;
//     }
//   }

//   void searchByFilter() {
//     selectedCategory = Provider.of<CategoryProvider>(
//       Constants.globalContext(),
//       listen: false,
//     ).selectedEntity;
//     selectedSubCategory = Provider.of<CategoryProvider>(
//       Constants.globalContext(),
//       listen: false,
//     ).selectedSubCategory;
//   }

//   @override
//   Future getData() async {
//     saveFilters();
//     Map<String, dynamic> dataToUse = {'page': pageIndex, ..._filters};

//     // ✅ Add search text
//     if (searchController.text.isNotEmpty) {
//       dataToUse['search'] = searchController.text;
//     }

//     final result = await productUseCase.getProducts(dataToUse);
//     result.fold((l) => showToast(l.message ?? "Error loading products"), (r) {
//       pageIndex++;
//       data ??= [];
//       data!.addAll(r);
//       if (r.isEmpty) paginationFinished = true;
//       notifyListeners();
//     });

//     paginationStarted = false;
//     notifyListeners();
//   }

//   /// Call this to update category
//   Future selectCategory(CategoryEntity category) async {
//     selectedCategory = category;
//     selectedSubCategory = null;
//     saveFilters();
//     await refresh();
//   }

//   /// Call this to update subcategory
//   Future selectSubCategory(CategoryEntity subCategory) async {
//     selectedSubCategory = subCategory;
//     saveFilters();
//     await refresh();
//   }

//   /// Call this to update price range
//   void selectPriceRange(RangeValues range) {
//     selectedPriceRange = range;
//     saveFilters();
//   }

//   /// Call this to update colors
//   void selectColors(colorId) {
//     selectedColors??=[];
//     if (!selectedColors!.contains(colorId)) {
//       selectedColors?.add(colorId);
//     }else{
//       selectedColors?.remove(colorId);
//     }
//     notifyListeners();
//     Provider.of<ColorsProvider>(Constants.globalContext(),listen: false).notifyListeners();
//     saveFilters();
//   }

//   /// Call this to update sizes
//   void selectSizes(List<String> sizes) {
//     selectedSizes = sizes;
//     saveFilters();
//   }
//   RangeValues priceRange = const RangeValues(0, 20000);

//   @override
//   void goToPage([Map<String, dynamic>? inputs]) {
//     SettingsProvider settingsProvider = Provider.of(Constants.globalContext(),listen: false);
//     priceRange = RangeValues(0, (settingsProvider.settingsEntity?.maxPrice?.toDouble()??20000));
//     navP(const FilterProductsView());
//   }

//   @override
//   @override
//   Future refresh() async {
//     data = null;
//     pageIndex = 1;
//     paginationFinished = false;
//     paginationStarted = false;
//     notifyListeners();
//     await getData();
//   }

//   @override
//   String displayedName() => selectedCategory?.name ?? "Select Category";

//   @override
//   Widget? displayedWidget() => const Icon(Icons.category, color: Colors.grey);

//   @override
//   String displayedOptionName(type) => type.name;

//   @override
//   Widget? displayedOptionWidget(type) => const Icon(Icons.label_outline);

//   @override
//   List<CategoryEntity> list() {
//     final categoryProvider = Provider.of<CategoryProvider>(
//       Constants.globalContext(),
//       listen: false,
//     );
//     return categoryProvider.data ?? [];
//   }

//   @override
//   Future onTap(data) async {
//     selectedCategory = data as CategoryEntity;
//     saveFilters();
//     notifyListeners();
//   }

//   void goToFromCategory(Map<String, dynamic> inputs) {
//     Provider.of<NavBarProvider>(
//       Constants.globalContext(),
//       listen: false,
//     ).changeIndex(2);
//     selectedCategory = inputs['category'];
//     // log(selectedCategory.toString());
//     refresh();
//   }

//   void goToFromSubcategory(Map<String, dynamic> inputs) {
//     Provider.of<NavBarProvider>(
//       Constants.globalContext(),
//       listen: false,
//     ).changeIndex(2);
//     selectedSubCategory = inputs['category'];
//     // log(selectedCategory.toString());
//     refresh();
//   }

//   void updateFavourite(int id, bool isFavorite) {
//     int index = data?.indexWhere((element) => element.id == id) ?? -1;
//     if (index != -1) {
//       data![index].isFavorite = isFavorite;
//       notifyListeners();
//     }
//   }

//   @override
//   bool require() => true;

//   @override
//   selected() => selectedCategory;

//   @override
//   String? titleName() => "Category";

//   @override
//   value() => selectedCategory?.id;

//   // Pagination
//   @override
//   int pageIndex = 1;

//   @override
//   bool paginationFinished = false;

//   @override
//   bool paginationStarted = false;

//   @override
//   void pagination() {}
//   TextEditingController searchController = TextEditingController();

//   Timer? _timer;
//   void onTextChanged() {
//     _timer?.cancel();
//     _timer = Timer(const Duration(seconds: 1), () async {
//       refresh();
//       _timer?.cancel();
//     });
//   }
// }