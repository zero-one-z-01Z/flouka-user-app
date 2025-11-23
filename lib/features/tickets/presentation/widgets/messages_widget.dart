import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/app_lotties.dart';
import '../../../../core/helper_function/convert.dart';
import '../../../../core/widgets/empty_animation.dart';
import '../provider/ticket_message_provider.dart';
import 'date_chat_widget.dart';
import 'message_widget.dart';

class TicketMessagesWidget extends StatelessWidget {
  const TicketMessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TicketMessageProvider ticketMessageProvider = Provider.of(context);
    if (ticketMessageProvider.ticketEntity!.messages != null &&
        ticketMessageProvider.ticketEntity!.messages!.isEmpty) {
      return EmptyAnimation(
        gif: Lotties.filesAnimation,
        width: 100.w,
        height: 40.h,
        title: "chat",
      );
    } else {
      return Expanded(
        child: ListView(
          reverse: true,
          controller: ticketMessageProvider.controllerList,
          children: List.generate(
            ticketMessageProvider.ticketEntity?.messages?.length ?? 3,
            (i) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  children: [
                    if ((i ==
                        ticketMessageProvider.ticketEntity!.messages!.length -
                            1))
                      TicketDateChatWidget(
                        messageEntity:
                            ticketMessageProvider.ticketEntity!.messages![i],
                      ),
                    TicketMessageWidget(
                      messageEntity:
                          ticketMessageProvider.ticketEntity!.messages![i],
                    ),
                    SizedBox(height: 0.5.h),
                    Row(
                      mainAxisAlignment:
                          !ticketMessageProvider.ticketEntity!.messages![i]
                              .fromMe()
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        // Text(formatTimeToAm(ticketMessageProvider.ticketEntity!.messages[i].date),style: TextStyleClass.smallStyle(),),
                        Text(
                          getDiffTime(
                            ticketMessageProvider
                                .ticketEntity!
                                .messages![i]
                                .createdAt,
                          ),
                          style: TextStyleClass.smallStyle().copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 0.5.h),
                    if (((i != 0 &&
                        ((ticketMessageProvider
                                .ticketEntity!
                                .messages![i]
                                .createdAt
                                .toLocal()
                                .toString()
                                .split(' ')
                                .first)) !=
                            (ticketMessageProvider
                                .ticketEntity!
                                .messages![i - 1]
                                .createdAt
                                .toLocal()
                                .toString()
                                .split(' ')
                                .first))))
                      TicketDateChatWidget(
                        messageEntity: ticketMessageProvider
                            .ticketEntity!
                            .messages![i - 1],
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      );
    }
  }
}
