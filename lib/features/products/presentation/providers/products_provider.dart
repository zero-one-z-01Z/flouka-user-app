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

  List<ProductEntity> get hotDeals => [
    ProductEntity(
      id: 1,
      name: 'Gaming Laptop',
      description: 'High performance gaming laptop',
      price: 1299.0,
      offerPrice: 999.0,
      active: true,
      marketId: 1,
      image: 'https://picsum.photos/200',
      images: [],
      rating: 4.5,
    ),
    ProductEntity(
      id: 2,
      name: 'Wireless Headphones',
      description: 'Noise cancelling headphones',
      price: 180.0,
      offerPrice: 120.0,
      active: true,
      marketId: 1,
      image: 'https://picsum.photos/201',
      images: [],
      rating: 4.2,
    ),
    ProductEntity(
      id: 3,
      name: 'Smartphone',
      description: 'Latest smartphone model',
      price: 899.0,
      offerPrice: 799.0,
      active: true,
      marketId: 1,
      image: 'https://picsum.photos/202',
      images: [],
      rating: 4.8,
    ),
    ProductEntity(
      id: 4,
      name: 'Tablet',
      description: 'Portable tablet for work and play',
      price: 599.0,
      offerPrice: 499.0,
      active: true,
      marketId: 1,
      image: 'https://picsum.photos/203',
      images: [],
      rating: 4.1,
    ),
    ProductEntity(
      id: 5,
      name: 'Gaming Mouse',
      description: 'Precision gaming mouse',
      price: 79.0,
      offerPrice: 59.0,
      active: true,
      marketId: 1,
      image: 'https://picsum.photos/204',
      images: [],
      rating: 4.4,
    ),
    ProductEntity(
      id: 6,
      name: 'Mechanical Keyboard',
      description: 'Clicky mechanical keyboard',
      price: 199.0,
      offerPrice: 150.0,
      active: true,
      marketId: 1,
      image: 'https://picsum.photos/205',
      images: [],
      rating: 4.6,
    ),
  ];
}
