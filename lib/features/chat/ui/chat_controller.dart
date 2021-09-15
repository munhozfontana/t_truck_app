import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:t_truck_app/core/adapters/protocols/i_logged_user.dart';
import 'package:t_truck_app/core/global_store/global_store_controller.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/chat/domain/entities/chat_message_entity.dart';
import 'package:t_truck_app/features/chat/domain/entities/chat_person_entity.dart';
import 'package:t_truck_app/features/chat/domain/use_cases/protocols/i_list_chat_people_case.dart';
import 'package:t_truck_app/features/chat/domain/use_cases/protocols/i_receive_chat_message_case.dart';
import 'package:t_truck_app/features/chat/domain/use_cases/protocols/i_send_chat_message_case.dart';

class ChatController extends GetxController {
  // injects
  ISendChatMessageCase iSendChatMessageCase;
  IReceiveChatMessageCase iReceiveChatMessageCase;
  IListChatPeopleCase iListChatPeopleCase;
  ILoggedUser iLoggedUser;

  // Variables
  Rx<ScrollController> listViewConMessages = ScrollController().obs;
  RxList<ChatPerson> listChatMessage = <ChatPerson>[].obs;
  RxList<ChatPerson> listChatMessageFiltred = <ChatPerson>[].obs;
  RxBool visibleChatTalkComponent = false.obs;
  RxBool chat = false.obs;
  RxBool anyNotification = false.obs;

  StreamSubscription? subScription;

  ChatController({
    required this.iSendChatMessageCase,
    required this.iReceiveChatMessageCase,
    required this.iListChatPeopleCase,
    required this.iLoggedUser,
  });

  TextEditingController textSendMessage = TextEditingController();
  TextEditingController trucksField = TextEditingController();

  Rx<ChatPerson> selectChat = ChatPerson(
    avatar: const Text(''),
    name: '',
    codPerson: '',
    messages: [],
  ).obs;

  @override
  void onInit() {
    super.onInit();

    getInitialData();
    listChatMessageFiltred.listen((listChatMessageListen) {
      if (listChatMessageListen
          .where((item) => item.notifications > 0)
          .isNotEmpty) {
        anyNotification.value = true;
      } else {
        anyNotification.value = false;
      }
    });
    trucksField.addListener(() {
      final trucksFieldClean = trucksField.value.text.trim();
      if (trucksFieldClean.isNotEmpty) {
        listChatMessageFiltred.value = listChatMessage.where((item) {
          return item.name.isCaseInsensitiveContainsAny(trucksFieldClean) ||
              item.codPerson.isCaseInsensitiveContainsAny(trucksFieldClean);
        }).toList();
      } else {
        listChatMessageFiltred.value = listChatMessage;
      }
      listChatMessageFiltred.refresh();
    });
  }

  Future<void> getInitialData() async {
    (await iListChatPeopleCase(
            Params(idUser: Get.find<GlobalStoreController>().user.value)))
        .fold(
      (l) => null,
      (r) {
        if (listChatMessage.isEmpty) {
          listChatMessage.addAll(r);
          listChatMessageFiltred.addAll(r);
          listChatMessageFiltred.refresh();
        } else {
          var newList = r
              .where((element) => !listChatMessage.any(
                    (itemChat) => itemChat.codPerson == element.codPerson,
                  ))
              .toList();

          if (newList.isNotEmpty) {
            listChatMessage.addAll(newList);
            listChatMessageFiltred.addAll(newList);
            listChatMessageFiltred.refresh();
          }
        }
      },
    );
  }

// --------------------------
  Future<void> onSendMessage() async {
    final chatMessage = ChatMessage(
      content: textSendMessage.text,
      codFrom: int.parse(Get.find<GlobalStoreController>().user.value),
      codTo: int.parse(selectChat.value.codPerson),
      createAt: DateTime.now(),
    );

    listChatMessageFiltred.value = listChatMessage.map((e) {
      if (e.codPerson == chatMessage.codTo.toString()) {
        e.messages.add(chatMessage);
      }
      return e;
    }).toList();

    listChatMessageFiltred.refresh();
    selectChat.refresh();
    update();
    rowDown();

    iSendChatMessageCase(
      Params(
        chatMessageEntity: chatMessage,
      ),
    );

    textSendMessage.clear();
  }

  void onReceiveMessage() {
    iReceiveChatMessageCase(
            Params(idUser: Get.find<GlobalStoreController>().user.value))
        .fold(
      (l) => null,
      (r) async {
        if (subScription != null) {
          await subScription!.cancel();
        }
        subScription = r.listen((data) {
          listChatMessageFiltred.value = listChatMessage.map((e) {
            if (e.codPerson == data.codFrom.toString()) {
              e.messages.add(data);
              if (selectChat.value.codPerson != data.codFrom.toString()) {
                e.notifications = e.notifications + 1;
              }
            }
            return e;
          }).toList();
          orderByNotification();
          listChatMessage.refresh();
          listChatMessageFiltred.refresh();
          update();
          selectChat.refresh();
          rowDown();
        });
      },
    );
  }

  void orderByNotification() {
    listChatMessage.sort((a, b) => b.notifications.compareTo(a.notifications));
    listChatMessageFiltred
        .sort((a, b) => b.notifications.compareTo(a.notifications));
  }

// --------------------------

  void onSelect(int index) {
    listChatMessage.value = listChatMessage.map((element) {
      if (element.codPerson == listChatMessageFiltred[index].codPerson) {
        return element.copyWith(notifications: 0);
      }
      return element;
    }).toList();

    listChatMessageFiltred[index] = listChatMessageFiltred[index].copyWith(
      notifications: 0,
    );

    selectChat.value = listChatMessageFiltred[index];

    listChatMessage.refresh();
    listChatMessageFiltred.refresh();
    update();
    openTab();
    rowDown();
  }

  bool isUserTalk(int index) {
    return selectChat.value.messages[index].codFrom ==
        int.parse(Get.find<GlobalStoreController>().user.value);
  }

  void rowDown() {
    Timer(
        Duration(milliseconds: 200),
        () => listViewConMessages.value.position.animateTo(
              listViewConMessages.value.position.maxScrollExtent,
              duration: const Duration(seconds: 1),
              curve: Curves.easeOutSine,
            ));
  }

  void closeTab() {
    visibleChatTalkComponent.value = false;
    selectChat = ChatPerson(
      avatar: Text(''),
      name: '',
      codPerson: '',
      messages: [],
    ).obs;
  }

  void openTab() => visibleChatTalkComponent.value = true;
  void openChat() => {
        getInitialData(),
        chat.value = true,
      };
  void closeChat() => chat.value = false;

  // Styles
  final edgeInsets = const EdgeInsets.only(
    top: 14,
    left: 16,
    right: 16,
    bottom: 14,
  );

  final boxDecoration = const BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(22),
      topRight: Radius.circular(22),
    ),
  );

  final RxDouble maxHeight = (330 * 1.4).obs;
  final RxDouble minHeight = (330 * 1.2).obs;
}
