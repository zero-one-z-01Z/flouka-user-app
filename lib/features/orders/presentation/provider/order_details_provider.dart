import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/core/dialog/success_dialog.dart';
import 'package:flouka/core/helper_function/loading.dart';
import 'package:flouka/features/orders/presentation/provider/order_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flouka/features/orders/domain/entity/order_entity.dart';
import 'package:provider/provider.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../domain/entity/order_details_entity.dart';
import '../../domain/use_case/order_use_case.dart';
import '../views/order_details_view.dart';
import '../views/update_order_view.dart';

class OrderDetailsProvider extends ChangeNotifier
    implements ProviderStructureModel<OrderDetailsEntity> {
  final OrderUseCase orderUseCase;
  OrderDetailsProvider(this.orderUseCase);

  @override
  OrderDetailsEntity? data;

  @override
  Map? inputs;

  bool isLoading = false;

  @override
  void clear() {
    data = null;
    notifyListeners();
  }

  @override
  Future<void> getData() async {
    if (inputs == null || inputs!['order_id'] == null) {
      showToast("Missing order ID");
      return;
    }

    isLoading = true;
    notifyListeners();

    final result = await orderUseCase.getUserOrderDetails({
      'order_id': int.tryParse(inputs!['order_id'].toString()),
      'order_vendor_id': int.tryParse(inputs!['order_vendor_id'].toString()),
    });

    result.fold(
      (l) {
        showToast(l.message ?? "Something went wrong while loading order details");
      },
      (r) {
        data = r;
      },
    );

    isLoading = false;
    notifyListeners();
  }

  void updateAfterRateSuccess({required bool isProduct, required int id}){
    if(isProduct){
      int index = data!.vendorOrder?.items?.indexWhere((element) => element.id == id) ?? -1;
      if(index != -1){
        data!.vendorOrder?.items?[index].canReviewProduct = false;
      }
    }else{
      if(data!.vendorOrder?.store?.id == id){
        data!.vendorOrder?.canRateStore =false;
      }
    }
    notifyListeners();
  }

  @override
  Future<void> goToPage([Map<String, dynamic>? inputs]) async {
    this.inputs = inputs;
    if (inputs == null || !inputs.containsKey('order_id')) {
      showToast("Missing order ID");
      return;
    }

    // Navigate first
    navP(const OrderDetailsView());

    // Fetch data safely
    await refresh();
  }

  @override
  Future<void> refresh() async {
    clear();
    await getData();
  }




}
