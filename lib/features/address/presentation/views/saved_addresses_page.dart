import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_lotties.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/empty_animation.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../providers/address_provider.dart';
import '../providers/map_provider.dart';
import '../widgets/saved_address_container_widget.dart';

class SavedAddressesPage extends StatelessWidget {
  const SavedAddressesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final addressProvider = context.watch<AddressProvider>();
    final mapProvider = context.watch<MapProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageProvider.translate('global', 'saved_addresses')),
      ),

      body: Builder(
        builder: (context) {
          if (addressProvider.address == null) {
            return const Center(child: LoadingAnimationWidget(gif: Lotties.loading));
          } else if (addressProvider.address!.isEmpty) {
            return const Center(
              child: EmptyAnimation(gif: Lotties.address, title: 'no_address'),
            );
          }
          return ListView.builder(
            itemCount: addressProvider.address!.length,
            itemBuilder: (context, index) {
              final address = addressProvider.address![index];
              return SavedAddressContainerWidget(address: address);
            },
          );
        },
      ),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.sp, vertical: 5.h),
        child: ButtonWidget(
          onTap: () {
            mapProvider.goToMapPage();
          },
          text: LanguageProvider.translate('global', 'add_location'),
          height: 7.h,
          borderRadius: 12,
        ),
      ),
    );
  }
}
