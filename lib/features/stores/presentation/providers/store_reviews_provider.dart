import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flouka/core/dialog/snack_bar.dart';
import 'package:flouka/core/models/pagination_class.dart';
import 'package:flouka/core/models/provider_structure_model.dart';
import '../../../products/domain/entity/product_review_entity.dart';
import '../../domain/use_case/store_use_case.dart';

class StoreReviewsProvider extends ChangeNotifier
    implements ProviderStructureModel<List<ProductReviewEntity>>, PaginationClass {
  final StoreUseCase storeUseCase;
  StoreReviewsProvider(this.storeUseCase);

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

  int? selectedCategoryId;
  String? searchQuery;

  ScrollController controller = ScrollController();

  final TextEditingController searchController = TextEditingController();
  Timer? _timer;

  void onTextChanged() {
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 1), () async {
      refresh();
      _timer?.cancel();
    });
  }


  @override
  void clear() {
    data = null;
    pageIndex = 1;
    paginationFinished = false;
    paginationStarted = false;
    notifyListeners();
  }

  void setStoreId(int storeId) {
    inputs = {'store_id': storeId};
    refresh();
  }

  @override
  Future getData() async {
    Map<String, dynamic> dataToUse = {
      'page': pageIndex,
      'store_id': inputs?['store_id'],
    };

    if(searchController.text.isNotEmpty){
      dataToUse['search'] = searchController.text;
    }
    print('dataToUse $dataToUse');
    final result = await storeUseCase.getReviews(dataToUse);
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
