import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/constants/app_lotties.dart';
import '../../../../core/helper_function/helper_function.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../provider/ticket_message_provider.dart';
import '../widgets/message_title_widget.dart';
import '../widgets/messages_widget.dart';
import '../widgets/send_message_widget.dart';

class TicketMessagePage extends StatelessWidget {
  const TicketMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    TicketMessageProvider ticketMessageProvider = Provider.of(context);
    if (ticketMessageProvider.ticketEntity != null) {
      delay(300).then((value) {
        ticketMessageProvider.scrollToBottom();
      });
    }
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Builder(
              builder: (context) {
                if (ticketMessageProvider.ticketEntity == null) {
                  // return LoadingAnimationWidget(gif: AppLotties.noChat, width: 100.w, height: 50.h,topPadding: 0,);
                  return LoadingAnimationWidget(
                    gif: Lotties.loading,
                    width: 100.w,
                    height: 28.h,
                    topPadding: 15.h,
                  );
                } else {
                  return Column(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const TicketMessageTitleWidget(),
                            SizedBox(height: 1.h),
                            const TicketMessagesWidget(),
                          ],
                        ),
                      ),
                      const TicketSendMessageWidget(),
                    ],
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
