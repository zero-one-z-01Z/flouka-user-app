import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flouka/features/address/domain/entities/address_entity.dart';
import 'package:flouka/features/address/domain/entities/area_entity.dart';
import 'package:flutter/material.dart';
import '../../../../core/dialog/confirm_dialog.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/pagination_class.dart';
import '../../../../core/models/provider_structure_model.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../../../products/domain/entity/product_image_entity.dart';
import '../../domain/entity/order_details_entity.dart';
import '../../domain/entity/order_entity.dart';
import '../../domain/use_case/order_use_case.dart';
import 'order_details_provider.dart';

class OrderProvider extends ChangeNotifier
    implements ProviderStructureModel<List<OrderEntity>>, PaginationClass {
  final OrderUseCase orderUseCase;

  OrderProvider(this.orderUseCase);

  @override
  List<OrderEntity>? data;

  @override
  Map? inputs;

  @override
  int pageIndex = 1;

  @override
  bool paginationFinished = false;

  @override
  bool paginationStarted = false;

  ScrollController controller = ScrollController();

  List<OrderEntity> get newOrders =>
      data?.where((order) => order.status == 'new').toList() ?? [];

  List<OrderEntity> get activeOrders =>
      data
          ?.where((order) => order.status != 'new' && order.status != 'cancelled')
          .toList() ??
      [];

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
  Future getData() async {
    // Map<String, dynamic> dataToUse = {'page': pageIndex};
    // final result = await orderUseCase.getUserOrders(dataToUse);

    // result.fold((l) => showToast(l.message ?? "Failed to loa d orders"), (r) {
    // pageIndex++;
    // data ??= [];
    // data!.addAll(r);
    // if (r.isEmpty) paginationFinished = true;
    // notifyListeners();
    // });
    data = [];
    data!.add(fakeOrder);
    data!.add(fakeOrder);
    paginationStarted = false;
    // log(dataToUse.toString());
    log(data.toString());
  }

  @override
  void goToPage([Map<String, dynamic>? inputs]) {
    refresh();
    // todo  navP(const OrdersView());
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

  Future<void> cancelOrder(
    int orderId, {
    OrderDetailsProvider? detailsProvider,
  }) async {
    final Either<DioException, bool> result = await orderUseCase.cancelOrder({
      'order_id': orderId,
    });

    result.fold((error) => showToast(error.message ?? "Failed to cancel order"), (
      success,
    ) {
      if (success) {
        final order = data?.firstWhere((o) => o.id == orderId);
        if (order != null) order.status = OrderStatus.cancelled;

        if (detailsProvider?.data != null) {
          detailsProvider!.data!.status = OrderStatus.cancelled;
          detailsProvider.notifyListeners();
        }

        notifyListeners();
      }
    });
  }

  showCancelOrderDialog(OrderDetailsProvider detailsProvider, int orderId) {
    confirmDialog(
      LanguageProvider.translate('buttons', 'cancel_order'),
      LanguageProvider.translate('buttons', 'cancel_order'),
      () {
        cancelOrder(orderId);
        navPop();
      },
    );
  }
}

final fakeOrder = OrderEntity(
  orderDetails: [
    OrderDetailsEntity(
      id: 555,
      price: 5654,
      color: 'asdasd',
      size: 'asdasd',
      productEntity: ProductEntity(
        id: 55,
        name: 'asdasd',
        description: 'asdasd',
        image: 'asdasd',
        price: 5654,
        offerPrice: 656,
        active: true,
        marketId: 55,
        images: [ProductImageEntity(id: 55, productId: 55, image: 'asdasd')],
      ),
    ),
  ],
  id: 515,
  subTotal: 6516,
  tax: 20,
  createdAt: DateTime.now(),
  discount: 20,
  total: 6516,
  delivery: 20,
  status: OrderStatus.accepted,
  date: DateTime.now(),
  phone: 'asdasd',
  name: 'asdasdas',
  address: AddressEntity(
    id: 55,
    userId: 55,
    areaEntity: AreaEntity(cityId: 655, partNumber: 20, id: 55, name: 'asdasd'),
    areaId: 55,
    partNumber: 55,
    addressName: 'asdasd',
    streetName: 'asdasd',
    lat: 20,
    lng: 20,
    building: 'asdasd',
    apartment: 'asdasd',
    notes: 'asdasd',
    createdAt: 'asdasd',
  ),
);
