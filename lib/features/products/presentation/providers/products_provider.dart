import 'package:flouka/features/products/domain/entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flouka/core/dialog/snack_bar.dart';
import 'package:flouka/core/models/pagination_class.dart';
import 'package:flouka/core/models/provider_structure_model.dart';
import 'package:flouka/features/products/domain/user_case/product_use_case.dart';

class ProductsProvider extends ChangeNotifier
    implements ProviderStructureModel<List<ProductEntity>>, PaginationClass {
  final ProductUseCase productUseCase;
  ProductsProvider(this.productUseCase);

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

  @override
  Future getData() async {
    Map<String, dynamic> dataToUse = {
      'page': pageIndex,
      if (selectedCategoryId != null) 'category_id': selectedCategoryId,
      if (searchQuery != null && searchQuery!.isNotEmpty) 'search': searchQuery,
    };

    final result = await productUseCase.getProducts(dataToUse);
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
  void goToPage([Map<String, dynamic>? inputs]) {}

  void setCategory(int? categoryId) async {
    selectedCategoryId = categoryId;
    clear();
    await getData();
  }

  Future searchProducts(String query) async {
    searchQuery = query;
    clear();
    await getData();
  }

  Future clearSearch() async {
    searchQuery = null;
    clear();
    await getData();
  }
}
