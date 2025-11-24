import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/helper_function/convert.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../../domain/entities/ticket_entity.dart';
import '../provider/ticket_message_provider.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({super.key, required this.ticket});
  final TicketEntity ticket;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Provider.of<TicketMessageProvider>(
          context,
          listen: false,
        ).goToMessagePage(id: ticket.id);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 4.w),
        margin: EdgeInsets.symmetric(vertical: 0.8.h, horizontal: 6.w),
        decoration: BoxDecoration(
          color: const Color(0xffF4F1F1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LanguageProvider.translate(
                      "ticket",
                      "ticket_number",
                    ).replaceFirst("*id*", "${ticket.id}"),
                    maxLines: 1,
                    style: TextStyleClass.smallStyle(),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    LanguageProvider.translate(
                      "ticket",
                      "ticket_category",
                    ).replaceFirst("*cat*", ticket.ticketCategory?.name ?? ""),
                    maxLines: 1,
                    style: TextStyleClass.smallStyle().copyWith(
                      color: const Color(0xff727272),
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    LanguageProvider.translate(
                      "ticket",
                      "ticket_date",
                    ).replaceFirst(
                      "*date*",
                      convertDateTimeToStringDMY(ticket.createdAt),
                    ),
                    maxLines: 1,
                    style: TextStyleClass.smallStyle().copyWith(
                      color: const Color(0xff727272),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(
                      0xffFF5F00,
                    ).withAlpha((0.39 * 255).round()),
                  ),
                  child: Text(
                    LanguageProvider.translate("ticket", ticket.status),
                    maxLines: 1,
                    style: TextStyleClass.smallStyle().copyWith().copyWith(
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
