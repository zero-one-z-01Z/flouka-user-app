import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/features/auth/presentation/widgets/profile_pages_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../address/presentation/providers/address_provider.dart';
import '../../../chat/presentation/providers/chat_provider.dart';
import '../../../orders/presentation/provider/order_provider.dart';
import '../../../stores/presentation/providers/followed_stores_provider.dart';

class ProfilePagesSection extends StatelessWidget {
  const ProfilePagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataList = [
      {
        "title": "orders",
        "subTitle": "manage_orders",
        "svg": AppImages.settingsOrders,
        "onTap": () {
          final ordersProvider = Provider.of<OrderProvider>(
            Constants.globalContext(),
            listen: false,
          );
          ordersProvider.goToPage();
        },
      },
      {
        "title": "favorite",
        "subTitle": "manage_favorites",
        "svg": AppImages.settingsFavorite,
        "onTap": () {
          final chatProvider = Provider.of<ChatProvider>(
            Constants.globalContext(),
            listen: false,
          );
          chatProvider.goToChatPage();
        },
      },
      {
        "title": "wallet",
        "subTitle": "0.0 US \$",
        "svg": AppImages.settingsWallet,
        "onTap": () {
          final followedStoresProvider = Provider.of<FollowedStoresProvider>(
            Constants.globalContext(),
            listen: false,
          );
          followedStoresProvider.goToPage();
        },
      },
      {
        "title": "address",
        "subTitle": "added",
        "svg": AppImages.settingsAddress,
        "onTap": () {
          final addressProvider = Provider.of<AddressProvider>(
            Constants.globalContext(),
            listen: false,
          );
          addressProvider.goToAddressPage();
        },
      },
    ];

    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dataList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        childAspectRatio: 2,
        crossAxisSpacing: 6,
      ),
      itemBuilder: (context, index) {
        return ProfilePagesContainerWidget(data: dataList[index]);
      },
    );
  }
}
