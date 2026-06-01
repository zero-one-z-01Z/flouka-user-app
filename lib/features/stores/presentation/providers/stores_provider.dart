import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/pagination_class.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../domain/entity/store_entity.dart';
import '../../domain/use_case/store_use_case.dart';
import '../pages/stores_page.dart';

class StoresProvider with ChangeNotifier
    implements ProviderStructureModel<List<StoreEntity>>, PaginationClass{
  final StoreUseCase storeUseCase;
  StoresProvider(this.storeUseCase);

  @override
  List<StoreEntity>? data;

  @override
  Map? inputs;

  @override
  int pageIndex = 1;

  @override
  bool paginationFinished = false;

  @override
  bool paginationStarted = false;

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
    };
    AuthProvider authProvider = Provider.of(Constants.globalContext(), listen: false);
    if(authProvider.currentLocation !=null){
      dataToUse['lat'] = authProvider.currentLocation?.latitude;
      dataToUse['lng'] = authProvider.currentLocation?.longitude;
    }
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${dataToUse}');

    final result = await storeUseCase.getStores(dataToUse);
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

  List<StoreEntity> homeStores=[];
  Future getHomeStores()async{
    Map<String, dynamic> dataToUse = {
      'page': pageIndex,
      'skip': 3,
    };
    AuthProvider authProvider = Provider.of(Constants.globalContext(), listen: false);
    if(authProvider.currentLocation !=null){
      dataToUse['lat'] = authProvider.currentLocation?.latitude;
      dataToUse['lng'] = authProvider.currentLocation?.longitude;
    }


    final result = await storeUseCase.getStores(dataToUse);
    result.fold((l) => showToast(l.message ?? "Error loading products"), (r) {
      homeStores=[];
      homeStores.addAll(r);
      notifyListeners();
    });
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
    notifyListeners();
    await getData();
  }

  // Future<void> getData() async {
  //   var response = await storeUseCase.getStores();
  //   response.fold((l) {}, (r) {
  //     stores = r;
  //     notifyListeners();
  //   });
  // }

  int current = 0;

  void changeCurrent(int index) async {
    if (current == index) return;
    current = index;
    notifyListeners();
  }

  @override
  void goToPage([Map<String, dynamic>? inputs]) {

    refresh();
    navP(const StoresPage());
  }
}
