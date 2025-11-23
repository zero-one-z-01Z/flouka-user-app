import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/empty_animation.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../provider/tickets_provider.dart';
import '../widgets/ticket_widget.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});
  @override
  Widget build(BuildContext context) {
    TicketsProvider ticketsProvider = Provider.of(context);
    ticketsProvider.pagination();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        appBar: AppBar(
          title: Text(LanguageProvider.translate("ticket", "support_ticket")),
          actions: [
            // Column(
            //   mainAxisSize: MainAxisSize.max,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     InkWell(
            //       onTap: () {
            //         Provider.of<AddTicketProvider>(
            //           context,
            //           listen: false,
            //         ).goToAddTicketPage();
            //       },
            //       child: Container(
            //         padding: EdgeInsets.symmetric(
            //           horizontal: 1.w,
            //           vertical: 1.h,
            //         ),
            //         margin: EdgeInsets.symmetric(
            //           vertical: 1.h,
            //           horizontal: 1.w,
            //         ),
            //         decoration: const BoxDecoration(),
            //         child: Row(
            //           children: [
            //             SizedBox(width: 2.w),
            //             Text(
            //               LanguageProvider.translate("ticket", "add_ticket"),
            //               style: AppStyles.style15Normal.copyWith(
            //                 color: Colors.white,
            //               ),
            //             ),
            //             SizedBox(width: 4.w),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            ticketsProvider.refresh();
          },
          child: SizedBox(
            width: 100.w,
            height: 100.h,
            child: SingleChildScrollView(
              controller: ticketsProvider.scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Builder(
                    builder: (context) {
                      if (ticketsProvider.tickets == null) {
                        return LoadingAnimationWidget(
                          gif: 'assets/lotties/loading.json',
                          width: 100.w,
                          height: 28.h,
                          topPadding: 15.h,
                        );
                        // return LoadingAnimationWidget(gif: AppLotties.noChat, width: 100.w, height: 50.h,topPadding: 0,);
                      } else if (ticketsProvider.tickets!.isEmpty) {
                        // return EmptyAnimation(title: "ticket",gif: AppLotties.noSearch,width: 100.w,);
                        return const EmptyAnimation(
                          title: "ticket",
                          gif: 'assets/lotties/empty.json',
                        );
                      }
                      return Column(
                        children: [
                          SizedBox(height: 1.5.h),
                          Wrap(
                            runSpacing: 0.5.h,
                            children: List.generate(
                              ticketsProvider.tickets!.length,
                              (index) => TicketWidget(
                                ticket: ticketsProvider.tickets![index],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 3.h),
                  if (ticketsProvider.paginationStarted) const LoadingWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
