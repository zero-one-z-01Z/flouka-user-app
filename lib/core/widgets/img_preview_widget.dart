import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../features/chat/presentation/provider/message_provider.dart';
import '../../features/tickets/presentation/provider/ticket_message_provider.dart';
import '../constants/constants.dart';
import '../helper_function/navigation.dart';
import 'button_widget.dart';

class ImagePreviewWidget extends StatelessWidget {
  final XFile? img;
  final String? imgPath;
  final bool showSendButton;
  final bool isTicket;
  const ImagePreviewWidget({this.img,this.imgPath,super.key, required this.showSendButton,this.isTicket=false});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: img ==null ?null:Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonWidget(onTap: (){
              navPop();
              if(isTicket){
                Provider.of<TicketMessageProvider>(context,listen: false).addMessage(file: img!, type: 'image');
              }else{
                Provider.of<MessageProvider>(context,listen: false).addMessage(file: img!, type: 'image');
              }
            }, text: 'send'),
            SizedBox(height: 1.h,),
          ],
        ),
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white,size: 6.w,),
            onPressed: () => Navigator.of(Constants.globalContext()).pop(),
          ),
          title: const SizedBox(),
        ),
        body: Container(
          width: 100.w,
          height: 95.h,
          decoration: BoxDecoration(
            image: img==null?DecorationImage(
              image: CachedNetworkImageProvider(imgPath!),
              fit: BoxFit.contain,
            ):DecorationImage(
              image: FileImage(File(img!.path)),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
