import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/config/app_color.dart';
import '../../../../../core/helper_function/navigation.dart';
import '../../../../../core/widgets/button_widget.dart';
import '../../../../../core/widgets/loading_animation_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/address_provider.dart';
import '../widgets/saved_address_container_widget.dart';
import 'select_address_map_page.dart';

class SavedAddressesPage extends StatelessWidget {
  const SavedAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addressProvider = context.watch<AddressProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageProvider.translate('global', 'saved_addresses')),
        // leading: IconButton(
        //   onPressed: () => navPop(),
        //   icon: const Icon(Icons.arrow_back_ios_new),
        // ),
      ),

      body: Builder(
        builder: (context) {
          if (addressProvider.address.isEmpty) {
            return const Center(
              child: LoadingAnimationWidget(
                gif: Lotties.loading,

              ),
            );
          }
          return ListView.builder(
            itemCount: addressProvider.address.length,
            itemBuilder: (context, index) {
              final address = addressProvider.address[index];
              return Slidable(
                direction: Axis.horizontal,
                key: ValueKey(address.id),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (_) {
                        // todo: handle edit address
                      },
                      backgroundColor: AppColor.primaryColor,
                      foregroundColor: Colors.white,
                      icon: Icons.edit,
                    ),
                    SlidableAction(
                      onPressed: (_) => addressProvider.deleteAddress(index),
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: SavedAddressContainerWidget(address: address),
              );
            },
          );
        },
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.sp, vertical: 5.h),
        child: ButtonWidget(
          onTap: () {
            navP(const SelectAddressMapPage());
          },
          text: LanguageProvider.translate('global', 'add_location'),
          height: 7.h,
          borderRadius: 12,
        ),
      ),
    );
  }
}
