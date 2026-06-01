import 'package:flutter/foundation.dart';
import 'package:flouka/features/orders/domain/entity/order_entity.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/dialog/success_dialog.dart';
import '../../../../core/helper_function/loading.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../domain/entity/order_details_entity.dart';
import '../../domain/use_case/order_use_case.dart';
import '../views/order_details_view.dart';
import '../views/update_order_view.dart';
import 'order_details_provider.dart';
import 'order_provider.dart';

class GetEditOrderProvider extends ChangeNotifier
    implements ProviderStructureModel<Map<String,dynamic>> {
  final OrderUseCase orderUseCase;
  GetEditOrderProvider(this.orderUseCase);

  @override
  Map<String,dynamic>? data;

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

    final result = await orderUseCase.getUserOrderEditDetails({
      'order_id': int.tryParse(inputs!['order_id'].toString()),
    });

    result.fold((l) {
        showToast(l.message ?? "Something went wrong while loading order details");
      }, (r) {
        data = r;
      },
    );

    isLoading = false;
    notifyListeners();
  }

  int? id ;
  void goToOutOfStockItemsPage({required int id}) {
    inputs = {'order_id': id};
    this.id = id;
    refresh();
    navP( const UpdateOrderView());
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

  Future<void> acceptOrderRules({required int id}) async {
    loading();
    final result = await orderUseCase.acceptOrderRules({
      'order_id':id,
    });
    navPop();

    result.fold((l) {
      showToast(l.message ?? "Something went wrong while loading order details");
    }, (r) {
      successDialog(then:(){
        navPop();
        if(data!=null){
          refresh();
          navPop();
        }else{
          OrderProvider orderProvider=Provider.of(Constants.globalContext(),listen: false);
          orderProvider.refresh();
        }

      });
    },
    );

  }
  Future<void> cancelOrder({required int id,bool isFromOrderDetails = false}) async {
    loading();
    final result = await orderUseCase.cancelOrder({
      'order_id': id,
    });
    navPop();

    result.fold((l) {
      showToast(l.message ?? "Something went wrong while loading order details");
    }, (r) {
      successDialog(then:(){
        if(isFromOrderDetails){
          OrderProvider orderProvider=Provider.of(Constants.globalContext(),listen: false);
          orderProvider.refresh();
        }else{
          navPop();
          OrderDetailsProvider orderDetailsProvider=Provider.of(Constants.globalContext(),listen: false);
          if(orderDetailsProvider.data!=null){
            refresh();
            navPop();
          }else{
            OrderProvider orderProvider=Provider.of(Constants.globalContext(),listen: false);
            orderProvider.refresh();
          }
        }
      });
    },
    );

  }

}
