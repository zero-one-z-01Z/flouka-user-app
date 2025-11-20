import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flouka/features/orders/presentation/provider/order_provider.dart';
import '../../../../core/config/app_styles.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../widget/oreders_list_view.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderProvider ordersProvider = Provider.of(context);
    ordersProvider.pagination();
    return Scaffold(
      backgroundColor: const Color(0xfff7f5f5),
      appBar: AppBar(
        title: Text(
          LanguageProvider.translate("global", "orders"),
          style: TextStyleClass.normalStyle().copyWith(fontWeight: FontWeight.w600),
        ),
        // leading: IconButton(
        //   onPressed: () => Navigator.pop(context),
        //   icon: const Icon(Icons.arrow_back_ios_new),
        // ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ordersProvider.refresh();
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: OrdersListViewWidget(),
        ),
      ),
    );
  }
}
