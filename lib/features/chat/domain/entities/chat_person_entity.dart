import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:t_truck_app/core/utils/string_utils.dart';
import 'package:t_truck_app/features/chat/domain/entities/chat_message_entity.dart';

class ChatPerson {
  final Widget avatar;
  final String name;
  final String codPerson;
  final List<ChatMessage> messages;
  int notifications;

  ChatPerson({
    required this.avatar,
    required this.name,
    required this.codPerson,
    required this.messages,
    this.notifications = 0,
  });

  ChatPerson copyWith({
    int? id,
    Widget? avatar,
    String? name,
    String? codPerson,
    List<ChatMessage>? messages,
    int? notifications,
  }) {
    return ChatPerson(
      avatar: avatar ?? this.avatar,
      name: name ?? this.name,
      codPerson: codPerson ?? this.codPerson,
      messages: messages ?? this.messages,
      notifications: notifications ?? this.notifications,
    );
  }

  factory ChatPerson.fromMap(Map<String, dynamic> map) {
    return ChatPerson(
      avatar: Text(
        StringUtils.fisrtAndLastLatter(
          map['NOME'],
        ),
      ),
      name: map['NOME'],
      codPerson: (map['MATRICULA'] as int).toString(),
      messages: [],
    );
  }

  factory ChatPerson.fromJson(String source) =>
      ChatPerson.fromMap(json.decode(source));
}
