import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/widgets/empty_animation.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
// import '../../../../core/widgets/shimmer_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../provider/notifications_provider.dart';
import '../widgets/notification_widget.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});
  final ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    NotificationProvider notificationProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageProvider.translate('global', 'notifications')),
        elevation: 0,
      ),
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: RefreshIndicator(
          onRefresh: () async {
            notificationProvider.refresh();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Builder(
              builder: (context) {
                if (notificationProvider.notifications == null) {
                  // return Column(
                  //   children: List.generate(
                  //     8,
                  //     (index) => ShimmerWidget(width: 100.w, height: 15.h),
                  //   ),
                  // );
                   return const Center(child: LoadingAnimationWidget(gif: Lotties.loading));
                } else if (notificationProvider.notifications!.isEmpty) {
                  return const EmptyAnimation(
                    gif: 'assets/lottie/no_search.json',
                    title: 'no_notifications',
                  );
                } else {
                  return Wrap(
                    children: List.generate(
                      notificationProvider.notifications!.length,
                      (index) {
                        return NotificationWidget(
                          notificationEntity:
                              notificationProvider.notifications![index],
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
