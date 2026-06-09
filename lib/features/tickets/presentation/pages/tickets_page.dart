import 'package:flouka/core/config/app_styles.dart';
import 'package:flouka/core/constants/app_images.dart';
import 'package:flouka/core/constants/app_lotties.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/empty_animation.dart';
import '../../../../core/widgets/loading_animation_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/svg_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../provider/add_ticket_provider.dart';
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
        appBar: AppBar(centerTitle: true,
          title: Text(LanguageProvider.translate("ticket", "support_ticket")),
          actions: [
            InkWell(
              onTap: (){
                Provider.of<AddTicketProvider>(context,listen: false).goToAddTicketPage();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w,),
                margin: EdgeInsets.symmetric(vertical: 1.h,horizontal: 2.w,),
                decoration:const BoxDecoration(
                    image: DecorationImage(image: AssetImage(AppImages.addTicket,),fit:BoxFit.contain)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 1.w,),
                    Icon(Icons.add, color: Colors.white, size: 4.w,),
                    SizedBox(width: 1.w,),
                    Text(LanguageProvider.translate("ticket","add_ticket"),
                      style: TextStyleClass.captionStyle(color: Colors.white),),
                    SizedBox(width: 2.w,),
                  ],
                ),
              ),
            ),
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
                          gif: Lotties.loading,
                          width: 40.w,
                          height: 10.h,
                          topPadding: 10.h,
                        );
                        // return LoadingAnimationWidget(gif: AppLotties.noChat, width: 100.w, height: 50.h,topPadding: 0,);
                      } else if (ticketsProvider.tickets!.isEmpty) {
                        // return EmptyAnimation(title: "ticket",gif: AppLotties.noSearch,width: 100.w,);
                        return const EmptyAnimation(
                          title: "",
                          gif: Lotties.noSearch,
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
