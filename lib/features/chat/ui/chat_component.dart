import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/components/layout/default_form.dart';
import 'package:t_truck_app/features/chat/ui/chat_talk_component.dart';

import 'chat_controller.dart';
import 'chat_user_component.dart';

class ChatComponent extends GetWidget<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: DefaultForm(
        children: [
          Obx(() {
            return Container(
              child: Stack(
                children: [
                  ChatUserComponent(
                    onSelect: controller.onSelect,
                    onClose: () {
                      Get.back();
                    },
                    width: 300,
                    height: controller.minHeight.value,
                  ),
                  const ChatTalkComponent()
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
