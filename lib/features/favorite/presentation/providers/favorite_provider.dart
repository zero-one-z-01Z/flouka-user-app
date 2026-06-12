import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/guest_dialog.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/pagination_class.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../../../products/domain/user_case/product_use_case.dart';
import '../../../products/presentation/widgets/hot_deals_home_container_widget.dart';
import '../views/favorite_view.dart';





class FavoriteProvider extends ChangeNotifier
    implements ProviderStructureModel<List<ProductEntity>> , PaginationClass {
  Set favoriteIds = {};
  final ProductUseCase productUseCase;

  FavoriteProvider(this.productUseCase);

  @override
  List<ProductEntity>? data = [];

  @override
  Map? inputs;

  @override
  void clear() {
    data = null;
    inputs = null;
    pageIndex = 1;
    paginationFinished = false;
    paginationStarted = false;
    notifyListeners();
  }
  @override
  int pageIndex = 1;

  @override
  bool paginationFinished = false;

  @override
  bool paginationStarted = false;

  ScrollController controller = ScrollController();

  @override
  Future getData() async {
    if (pageIndex == 1) {
      data = null;
      notifyListeners();
    }
    Map<String, dynamic> dataToUse = {'page': pageIndex};
    AuthProvider authProvider = Provider.of<AuthProvider>(Constants.globalContext(), listen: false);
    if(authProvider.currentLocation !=null){
      dataToUse['lat'] = authProvider.currentLocation?.latitude;
      dataToUse['lng'] = authProvider.currentLocation?.longitude;
    }
    final result = await productUseCase.getFavorites(dataToUse);

    result.fold((l) => showToast(l.message ?? "Failed to load orders"), (r) {
      data ??= [];
      data!.addAll(r);
      pageIndex++;
      if (r.isEmpty) paginationFinished = true;
      notifyListeners();
    });

    paginationStarted = false;
  }

  void toggleFavorite(ProductEntity product) {
    if (!AuthProvider.isLogin())
      {
        showGuestDialog();
        return;
      }
    productUseCase.updateFavorite({'id':product.id,'type':"product"});
    if (favoriteIds.contains(product.id)) {
      favoriteIds.remove(product.id);
    }else{
      favoriteIds.add(product.id);
    }
    notifyListeners();
  }

  @override
  void goToPage([Map<String, dynamic>? inputs]) {
    refresh();
    navP(const FavoriteView());
  }

  @override
  Future refresh() async {
    clear();
    await getData();
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
}
