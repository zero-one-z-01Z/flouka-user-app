import 'package:flouka/features/language/presentation/provider/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/see_all_button.dart';
import '../providers/stores_provider.dart';
import 'stores_container_home_widget.dart';

class StoresHomeSection extends StatelessWidget {
  const StoresHomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stores = context.watch<StoresProvider>().stores;
    final visibleStores = stores.take(3).toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LanguageProvider.translate('home', 'retail_stores'),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SeeAllButton(),
              ],
            ),
          ),
          SizedBox(height: 1.h),
          Column(
            children: [
              for (final store in visibleStores) ...[
                StoresContainerHomeWidget(store: store),
                if (store != visibleStores.last) SizedBox(height: 1.h),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
