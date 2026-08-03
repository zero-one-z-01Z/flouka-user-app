import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/helper_function/notifications.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../products/data/models/product_model.dart';
import '../../../products/domain/entity/product_entity.dart';
import '../../domain/entities/chat_message.dart';
import '../../domain/use_cases/send_chat_message_usecase.dart';
import '../pages/chat_page.dart';

class ChatBotProvider extends ChangeNotifier {
  final SendAiMessageUseCase sendMessageUseCase;

  ChatBotProvider(this.sendMessageUseCase);

  bool insidePage = false;
  bool insideApp = false;
  void setInsideApp(){
    insideApp = true;
    notifyListeners();
  }

  void goToChatBotPage(){
    clear();
    insidePage = true;
    notifyListeners();
    navP(ChatBotPage(),then: (val){
      insidePage = false;
      notifyListeners();
    });
    scrollToBottom();

  }

  /// list of messages (chat entity)
  final List<dynamic> _messages = [];
  bool _isTyping = false;

  List<dynamic> get messages => List.unmodifiable(_messages);
  bool get isTyping => _isTyping;

  /// send user message + get AI reply
  Future<void> sendUserMessage(String text,{bool fromMakeOrder = false}) async {
    if (text.trim().isEmpty) return;

    if(!fromMakeOrder){
      _messages.add(ChatMessage(role: ChatRole.user, text: text));
      scrollToBottom();

      notifyListeners();

      _isTyping = true;
      notifyListeners();
    }

    try {
      Map<String,dynamic> apiData = {'text':text};
      AuthProvider authProvider = Provider.of<AuthProvider>(Constants.globalContext(), listen: false);
      apiData['lat']=authProvider.currentLocation?.latitude;
      apiData['lng']=authProvider.currentLocation?.longitude;
      apiData['page'] = 1;
      final random = Random();
      final int key = 100000 + random.nextInt(900000);
      apiData['seed'] = key;

      Either<DioException, dynamic> response = await sendMessageUseCase.aiChat(apiData);

      response.fold((l) => showToast(l.message ?? "Error loading chat"), (r) {
        if(r is String){
          _messages.add(ChatMessage(role: ChatRole.bot, text: r));
        }else{
          List<ProductEntity> list = [];
          for(var i in r){
            list.add(ProductModel.fromJson(i));
          }
          _messages.add(list);
        }

      });

      scrollToBottom();
    } catch (e) {
      _messages.add(
        ChatMessage(role: ChatRole.bot, text: "Error: ${e.toString()}"),
      );
    }
    _isTyping = false;
    playSuccessSound(path: 'new_message.mp4');

    notifyListeners();
  }
  /// clear all messages
  void clear() {
    _messages.clear();
    notifyListeners();
  }

  /// navigate to a page
  void goTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }
  ScrollController controllerList = ScrollController();

  void scrollToBottom() async {
    try {
      if (controllerList.hasClients) {
        await controllerList.animateTo(
          controllerList.position.maxScrollExtent+20000,
          curve: Curves.linear,
          duration: const Duration(milliseconds: 100),
        );
      } else {}
    } catch (e) {}
  }

  /// dispose controllers / cleanup
  @override
  void dispose() {
    _messages.clear();
    super.dispose();
  }

  void rebuild() {
    notifyListeners();
  }
}
