import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/helper_function/image.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/widgets/img_preview_widget.dart';
import '../../../../core/widgets/text_field_widget.dart';
import '../../../language/presentation/provider/language_provider.dart';
import '../provider/ticket_message_provider.dart';

class TicketSendMessageWidget extends StatelessWidget {
  const TicketSendMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TicketMessageProvider ticketMessageProvider = Provider.of(context);
    GlobalKey btnKey = GlobalKey();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 100.w,
        margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
        decoration: BoxDecoration(
          // color: Colors.white,boxShadow: [BoxShadow(color: Colors.black.withAlpha((0.12*255).round()),offset: Offset(8, 0),
          // blurRadius: 12,spreadRadius: 0)],
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // if(ticketMessageProvider.controller.text.isEmpty)
                //   SocialMediaRecorder(
                //     sendRequestFunction: (soundFile,time) async{
                //       await delay(100);
                //       ticketMessageProvider.addMessage(file: soundFile,type: 'audio',sec: convertToSeconds(time));
                //     },
                //     recordIconWhenLockBackGroundColor: Colors.transparent,
                //     recordIconWhenLockedRecord: Icon(
                //       Icons.send,
                //       // textDirection: LanguageProvider.isAr()?TextDirection.ltr:TextDirection.ltr,
                //       size:18.sp,
                //       color: Colors.grey,
                //     ),
                //     slideToCancelTextStyle: TextStyleClass.semiStyle(color: Colors.grey),
                //     cancelTextStyle: TextStyleClass.semiStyle(color: Colors.grey),
                //     counterTextStyle: TextStyleClass.semiStyle(color: Colors.grey),
                //     recordIconBackGroundColor: Colors.transparent,
                //     fullRecordPackageHeight: 6.h,
                //     counterBackGroundColor: Colors.transparent,
                //     cancelText: LanguageProvider.translate("buttons", "cancel"),
                //     slideToCancelText:  LanguageProvider.translate("chat", "slide_to_cancel"),
                //     cancelTextBackGroundColor: Colors.transparent,
                //     // recordIcon: Icon(Icons.mic,color: AppColor.textColor,size: Constants.isTablet?40:30,),
                //     recordIcon: Padding(
                //       padding:  EdgeInsets.only(bottom: 1.h),
                //       child: Icon(Icons.mic,color: Colors.grey,size:18.sp,),
                //     ),
                //     backGroundColor: Colors.transparent,
                //
                //   ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        key: btnKey,
                        onTap: () async {
                          XFile? image = await chooseImage();
                          if (image != null) {
                            navP(
                              ImagePreviewWidget(
                                img: image,
                                showSendButton: false,
                              ),
                            );
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 2.h),
                          child: Icon(
                            Icons.attachment,
                            color: Colors.grey,
                            size: 20.sp,
                          ),
                          // child: SvgWidget(svg: Assets.attachment,width: 6.w,),
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: TextFieldWidget(
                          controller: ticketMessageProvider.controller,
                          maxLines: 3,
                          minLines: 1,
                          // height: 5.h,
                          counter: "",
                          onChange: (val) {
                            if (val.isEmpty) {
                              ticketMessageProvider.rebuild();
                            }
                            if (val.length == 1) {
                              ticketMessageProvider.rebuild();
                            }
                          },
                          hintText: LanguageProvider.translate(
                            "inputs",
                            "enter_message",
                          ),
                          style: TextStyleClass.normalStyle().copyWith(
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 1.h,
                            horizontal: 3.w,
                          ),
                          borderRadius: 4,
                          borderColor: Colors.transparent,
                        ),
                      ),
                      SizedBox(width: 2.w),
                    ],
                  ),
                ),
                if (ticketMessageProvider.controller.text.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(bottom: 2.h),
                    child: InkWell(
                      onTap: () {
                        if (ticketMessageProvider.controller.text.isNotEmpty) {
                          FocusScope.of(context).unfocus();
                          ticketMessageProvider.addMessage(type: 'text');
                        }
                      },
                      child: Icon(
                        Icons.send,
                        color: AppColor.primaryColor,
                        size: 20.sp,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
    // return  Container(width: 100.w,
    //   padding: EdgeInsets.symmetric(horizontal: 2.w),
    //   child: SafeArea(
    //     child: ChatInputField(
    //       onRecordComplete: (val)async{
    //         await delay(100);
    //         // getDownloadPath(val);
    //         // ticketMessageProvider.addMessage(file: val.chatMedia!.url,type: 'audio',sec: 0);
    //       },
    //       textFieldDecoration: InputDecoration.collapsed(
    //         hintText: LanguageProvider.translate("complains", "type_message"),
    //       ),
    //       cameraText: LanguageProvider.translate("global", "camera"),
    //       galleryText: LanguageProvider.translate("global", "photo"),
    //       cancelText: LanguageProvider.translate("global", ""),
    //       onImageSelected: (val){
    //         //                       XFile? image = await chooseImage();
    //         //                       if(image!=null){
    //         //                         navP(ImagePreviewWidget(img: image, showSendButton: false,));
    //         //                       }
    //
    //       },
    //       waveStyle: WaveAnimationStyle(),
    //       decoration: BoxDecoration(
    //         color: Colors.transparent,
    //         borderRadius: BorderRadius.circular(8),
    //         border: Border.all(color: Colors.grey.shade200)
    //       ),
    //
    //       textController: ticketMessageProvider.controller,
    //       // decoration: BoxDecoration(color: ),
    //       onTextSubmit: (ChatMessage value) {
    //         print('${value}');
    //         ticketMessageProvider.addMessage(type: "text",);
    //       }, recordingNoteHintText: '',
    //     ),
    //   ),
    // );
  }
}
