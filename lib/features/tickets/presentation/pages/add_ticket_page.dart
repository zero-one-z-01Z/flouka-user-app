import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/widgets/button_widget.dart';
import '../../../../core/widgets/list_text_field_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../provider/add_ticket_provider.dart';

class AddTicketPage extends StatelessWidget {
  AddTicketPage({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AddTicketProvider addTicketCubit =Provider.of(context);
    return 
       SafeArea(
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(title: Text(LanguageProvider.translate("ticket","add_ticket"))),
          body: SizedBox(
            width: 100.w,
            height: 100.h,
            child: Form(
              key:formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 6.w,vertical: 2.h),
                        child: ListTextFieldWidget(inputs: addTicketCubit.ticketInputs,color: const Color(0xffEEEEEE),borderColor: Colors.transparent,),
                      ),
                    ),
                  ),
                  Center(child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 6.w,vertical: 2.h),
                    child: ButtonWidget(onTap: (){
                      if(formKey.currentState!.validate()){
                       addTicketCubit.createTicket();
                      }
                    }, text: "start_chat"),
                  ))
                ],
              ),
            ),
          ),
        ),
      );
  }
}
