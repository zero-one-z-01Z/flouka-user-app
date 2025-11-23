import 'package:flutter/foundation.dart';
import 'package:flouka/features/orders/domain/entity/order_entity.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../../../products/domain/entity/product_image_entity.dart';
import '../../domain/entity/order_details_entity.dart';
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

    data = orderEntity;
    // final result = await orderUseCase.getUserOrderDetails({
    //   'order_id': int.tryParse(inputs!['order_id'].toString()),
    // });

    // result.fold(
    //   (l) {
    //     showToast(l.message ?? "Something went wrong while loading order details");
    //   },
    //   (r) {
    //     data = r;
    //     if (kDebugMode) {
    //       print("✅ Order details loaded successfully (ID: ${inputs!['order_id']})");
    //     }
    //   },
    // );

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

final OrderEntity orderEntity = OrderEntity(
  orderDetails: [
    OrderDetailsEntity(
      productEntity: ProductEntity(
        id: 55555,
        name: 'Lenovo Yoga 920 13/Core i7/16GB/SSD 1TB',
        description: '',
        price: 1000,
        offerPrice: 1000,
        active: true,
        marketId: 55555,
        image: 'mohsen',
        images: [
          ProductImageEntity(
            id: 55555,
            productId: 55555,
            image: 'mohsen',
          ),
        ],
      ),
      id: 55555,
      price: 1000,
      color: '',
      size: '',
    ),
  ],
  id: 55555,
  subTotal: 1000,
  tax: 1000,
  createdAt: DateTime.now(),
  discount: 1000,
  total: 1000,
  delivery: 1000,
  status: OrderStatus.accepted,
  date: DateTime.now(),
  phone: '123456789',
  name: "Lenovo Yoga 920 13/Core i7/16GB/SSD 1TB",
  address: null,
);
