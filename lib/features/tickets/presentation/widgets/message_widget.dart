import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/config/app_color.dart';
import '../../../../core/config/app_styles.dart';
import '../../../../core/constants/constants.dart';
import '../../domain/entities/ticket_message_entity.dart';

class TicketMessageWidget extends StatefulWidget {
  const TicketMessageWidget({super.key, required this.messageEntity});
  final TicketMessageEntity messageEntity;
  @override
  State<TicketMessageWidget> createState() => _MessageWidgetState();
}

class _MessageWidgetState extends State<TicketMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: !widget.messageEntity.fromMe()
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        if (widget.messageEntity.type == 'text')
          Center(
            child: Column(
              crossAxisAlignment: !(widget.messageEntity.fromMe())
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 65.w, minWidth: 20.w),
                  // width: 65.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    // gradient: (widget.messageEntity.fromMe())?  null:AppColor.gradient ,
                    color: !(widget.messageEntity.fromMe())
                        ? Colors.grey.shade200
                        : AppColor.primaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                      horizontal: 2.w,
                    ),
                    child: Text(
                      widget.messageEntity.message,
                      style: TextStyleClass.normalStyle().copyWith(
                        color: !(widget.messageEntity.fromMe())
                            ? Colors.black
                            : Colors.white,
                      ),
                      // textAlign: Provider.of<LanguageProvider>(context,listen: false).appLocal.languageCode=='en'?
                      //     TextAlign.end:TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ),
        if (widget.messageEntity.type == 'audio')
          SizedBox(
            width: Constants.isTablet ? 50.w : null,
            // child: VoiceMessageView(
            //   backgroundColor: !(widget.messageEntity.fromMe())
            //       ? Colors.grey.shade200
            //       : AppColor.primaryColor,
            //   controller: widget.messageEntity.voiceController!,
            //   innerPadding: 12,
            //   cornerRadius: 20,
            //   activeSliderColor: !(widget.messageEntity.fromMe())
            //       ? AppColor.primaryColor
            //       : Colors.grey.shade200,
            //   playIcon: Icon(
            //     Icons.play_arrow,
            //     color: !(widget.messageEntity.fromMe())
            //         ? Colors.grey.shade200
            //         : AppColor.primaryColor,
            //     size: Constants.isTablet ? 8.w : 5.w,
            //   ),
            //   pauseIcon: Icon(
            //     Icons.pause,
            //     color: !(widget.messageEntity.fromMe())
            //         ? Colors.grey.shade200
            //         : AppColor.primaryColor,
            //     size: Constants.isTablet ? 8.w : 5.w,
            //   ),
            //   refreshIcon: Icon(
            //     Icons.refresh,
            //     color: !(widget.messageEntity.fromMe())
            //         ? Colors.grey.shade200
            //         : AppColor.primaryColor,
            //     size: Constants.isTablet ? 8.w : 5.w,
            //   ),
            //   stopDownloadingIcon: Icon(
            //     Icons.stop,
            //     color: !(widget.messageEntity.fromMe())
            //         ? Colors.grey.shade200
            //         : AppColor.primaryColor,
            //     size: Constants.isTablet ? 8.w : 5.w,
            //   ),
            //   circlesColor: !(widget.messageEntity.fromMe())
            //       ? AppColor.primaryColor
            //       : Colors.grey.shade200,
            //   size: (Constants.isTablet ? 10.w : 30),
            //   circlesTextStyle: AppStyles.style15Normal.copyWith(
            //     color: !(widget.messageEntity.fromMe())
            //         ? Colors.white
            //         : AppColor.primaryColor,
            //   ),
            //   counterTextStyle: AppStyles.style15Normal.copyWith(
            //     color: !(widget.messageEntity.fromMe())
            //         ? AppColor.primaryColor
            //         : Colors.white,
            //   ),
            // ),
          ),
        if (widget.messageEntity.type == 'image')
          Row(
            mainAxisAlignment: widget.messageEntity.fromMe()
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  // navP(ImagePreviewWidget(imgPath: widget.messageEntity.isFile?null:widget.messageEntity.message,
                  //   img: !widget.messageEntity.isFile?null:XFile(widget.messageEntity.message), showSendButton: false,));
                },
                child: Container(
                  constraints: BoxConstraints(maxWidth: 30.w, maxHeight: 22.h),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget.messageEntity.imageProvider(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
