import 'package:flouka/core/helper_function/navigation.dart';
import 'package:flouka/features/products/domain/entity/product_review_entity.dart';
import 'package:flutter/material.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/models/pagination_class.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../../products/domain/user_case/product_use_case.dart';
import '../views/product_reviews_page.dart';

class ProductReviewsProvider extends ChangeNotifier
    implements ProviderStructureModel<List<ProductReviewEntity>>, PaginationClass {
  final ProductUseCase productUseCase;

  ProductReviewsProvider(this.productUseCase);

  @override
  List<ProductReviewEntity>? data;

  @override
  Map? inputs;

  @override
  int pageIndex = 1;

  @override
  bool paginationFinished = false;

  @override
  bool paginationStarted = false;

  ScrollController controller = ScrollController();

  TextEditingController searchController = TextEditingController();

  void clear() {
    data = null;
    pageIndex = 1;
    paginationFinished = false;
    paginationStarted = false;
    notifyListeners();
  }

  @override
  Future getData() async {
    Map<String, dynamic> dataToUse = {'page': pageIndex};
    dataToUse['product_id'] = inputs?['product_id'];
    final result = await productUseCase.getProductReviews(dataToUse);

    result.fold((l) => showToast(l.message ?? "Failed to load orders"), (r) {
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
  void goToPage([Map<String, dynamic>? inputs]) {
    this.inputs = inputs;
    refresh();
    navP(const ProductReviewsPage());
  }

  @override
  void pagination() {
    controller.addListener(() async {
      if (controller.position.atEdge && controller.position.pixels > 50) {
        if (!paginationFinished &&
            !paginationStarted &&
            (data?.isNotEmpty ?? false)) {
          paginationStarted = true;
          notifyListeners();
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

}
