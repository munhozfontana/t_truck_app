import 'package:get/get.dart';
import 'package:t_truck_app/features/chat/data/external/chat_message_external.dart';
import 'package:t_truck_app/features/chat/data/external/chat_people_external.dart';
import 'package:t_truck_app/features/chat/data/external/protocols/i_chat_message_external.dart';
import 'package:t_truck_app/features/chat/data/external/protocols/i_chat_people_external.dart';
import 'package:t_truck_app/features/chat/data/repositories_impl/chat_message_repository.dart';
import 'package:t_truck_app/features/chat/data/repositories_impl/chat_people_repository.dart';
import 'package:t_truck_app/features/chat/domain/repositories/i_chat_message_repository.dart';
import 'package:t_truck_app/features/chat/domain/repositories/i_chat_people_repository.dart';
import 'package:t_truck_app/features/chat/domain/use_cases/list_chat_people_case.dart';
import 'package:t_truck_app/features/chat/domain/use_cases/protocols/i_list_chat_people_case.dart';
import 'package:t_truck_app/features/chat/domain/use_cases/protocols/i_receive_chat_message_case.dart';
import 'package:t_truck_app/features/chat/domain/use_cases/protocols/i_send_chat_message_case.dart';
import 'package:t_truck_app/features/chat/domain/use_cases/receive_chat_message_case.dart';
import 'package:t_truck_app/features/chat/domain/use_cases/send_chat_message_case.dart';

import 'chat_controller.dart';

class ChatBiding extends Bindings {
  @override
  void dependencies() {
    chat();
  }

  void chat() {
    Get.lazyPut<IChatMessageExternal>(
      () => ChatMessageExternal(),
    );

    Get.lazyPut<IChatPeopleExternal>(
      () => ChatPeopleExternal(iHttp: Get.find()),
    );

    Get.lazyPut<IChatMessageRepository>(
      () => ChatMessageRepository(
        iChatMessageExternal: Get.find(),
      ),
    );

    Get.lazyPut<IChatPeopleRepository>(
      () => ChatPeopleRepository(
        iChatPeopleExternal: Get.find(),
      ),
    );

    Get.lazyPut<IListChatPeopleCase>(
      () => ListChatPeopleCase(
        iChatPeopleRepository: Get.find(),
      ),
    );

    Get.lazyPut<IReceiveChatMessageCase>(
      () => ReceiveChatMessageCase(
        iChatMessageRepository: Get.find(),
      ),
    );

    Get.lazyPut<ISendChatMessageCase>(
      () => SendChatMessageCase(
        iChatMessageRepository: Get.find(),
      ),
    );

    Get.put(
        ChatController(
          iLoggedUser: Get.find(),
          iListChatPeopleCase: Get.find(),
          iReceiveChatMessageCase: Get.find(),
          iSendChatMessageCase: Get.find(),
        ),
        permanent: true);
  }
}
