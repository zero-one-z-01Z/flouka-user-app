import 'package:flutter/foundation.dart';
import 'package:flouka/features/orders/domain/entity/order_entity.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../domain/use_case/order_use_case.dart';

class OrderDetailsProvider extends ChangeNotifier
    implements ProviderStructureModel<OrderEntity> {
  final OrderUseCase orderUseCase;
  OrderDetailsProvider(this.orderUseCase);

  @override
  OrderEntity? data;

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
    });

    result.fold(
      (l) {
        showToast(l.message ?? "Something went wrong while loading order details");
      },
      (r) {
        data = r;
        if (kDebugMode) {
          print("✅ Order details loaded successfully (ID: ${inputs!['order_id']})");
        }
      },
    );

    isLoading = false;
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
    // todo : navP(const OrderDetailsView());

    // Fetch data safely
    await refresh();
  }

  @override
  Future<void> refresh() async {
    clear();
    await getData();
  }
}
