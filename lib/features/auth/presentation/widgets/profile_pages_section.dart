import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/features/auth/presentation/widgets/profile_pages_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfilePagesSection extends StatelessWidget {
  const ProfilePagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> titleList = ["orders", "favorite", "wallet", "address"];

    List<String> subTitleList = [
      "manage_orders",
      "manage_favorites",
      "added",
      "0.0 US \$",
    ];

    List<String> svgList = [
      Images.settingsOrders,
      Images.settingsFavorite,
      Images.settingsWallet,
      Images.settingsAddress,
    ];

    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: titleList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        childAspectRatio: 2,
        crossAxisSpacing: 6,
      ),
      itemBuilder: (context, index) {
        return ProfilePagesContainerWidget(
          title: titleList[index],
          subTitle: subTitleList[index],
          svg: svgList[index],
        );
      },
    );
  }
}
