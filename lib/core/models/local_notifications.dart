import 'dart:convert';
import 'package:flouka/core/constants/constants.dart';
import 'package:flouka/features/orders/presentation/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import '../../features/chat/presentation/provider/message_provider.dart';
import '../../features/tickets/presentation/provider/ticket_message_provider.dart';
import '../../features/tickets/presentation/provider/tickets_provider.dart';
import '../helper_function/convert.dart';
import '../helper_function/helper_function.dart';

class NotificationLocalClass {
  static final FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static Future notificationDet() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'test',
        'c_name',
        importance: Importance.max,
        priority: Priority.high,
        showWhen: false,
        playSound: true,
        channelShowBadge: true,
        channelDescription: 'c_des',
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  static Future showNoti({
    int? id,
    required String title,
    required String body,
    required String payload,
  }) async {
    try {
      notificationsPlugin.show(
        id ?? DateTime.now().millisecond,
        title,
        body,
        await notificationDet(),
        payload: payload,
      );
      delay(2500).then((value) => notificationsPlugin.cancelAll());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future init({bool initScheduled = false}) async {
    final settings = InitializationSettings(
      android: const AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(
          requestSoundPermission: true,
          requestBadgePermission: true,
          requestAlertPermission: true,
          defaultPresentBadge: true,
          onDidReceiveLocalNotification: (id,title,body,pay)async{
            clickNoti(pay!);
          }
      ),
    );
    await notificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (pay) async {
        clickNoti(pay.payload!);
      },
      // onDidReceiveBackgroundNotificationResponse: localMessagingBackgroundHandler,
    );
  }
}

void clickNoti(String pay) async {
  Map payload = jsonDecode(pay);
  if (payload.containsKey('message_type_')) {
    if (payload['message_type_'] == "chat") {
      Map message = jsonDecode(payload['data_']);
      MessageProvider messageProvider = Provider.of(Constants.globalContext(),listen: false);
      if(messageProvider.chatEntity==null){
        messageProvider.goToMessagePage(orderId: message['order_id'],storeId: message['store_id']);
      }else{
        messageProvider.getMessages(orderId: message['order_id'],storeId: message['store_id']);
      }
    }
  } else if (payload['message_type_'] == "order") {
    int orderId = convertStringToInt(jsonDecode(payload['data_']));
    OrderProvider orderProvider = Constants.globalContext().read();
    if(orderProvider.data==null){
      orderProvider.goToPage();
    }
  }else if(payload['message_type_']=="ticket"){
    TicketsProvider ticketsProvider = Provider.of(Constants.globalContext(),listen: false);
    Map message = jsonDecode(payload['data_']);
    TicketMessageProvider messageProvider = Provider.of(Constants.globalContext(),listen: false);
    if(messageProvider.ticketEntity==null){
      ticketsProvider.goToTicketsPage();
      messageProvider.getTicketDetails(id: message['ticket_id']);
    }else{
      messageProvider.getTicketDetails(id: message['ticket_id']);
    }
  }else if(payload['message_type_']=="ticket_status"){
    TicketsProvider ticketsProvider = Provider.of(Constants.globalContext(),listen: false);
    int id = convertStringToInt(jsonDecode(payload['data_']));
    TicketMessageProvider messageProvider = Provider.of(Constants.globalContext(),listen: false);
    if(ticketsProvider.tickets==null){
      ticketsProvider.goToTicketsPage();
      messageProvider.getTicketDetails(id: id);
    }else{
      messageProvider.getTicketDetails(id: id);
    }
  }
}
