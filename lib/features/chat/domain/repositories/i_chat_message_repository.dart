import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/chat/domain/entities/chat_message_entity.dart';

abstract class IChatMessageRepository {
  Either<Failure, void> sendMessage(ChatMessage chatMessage);
  Either<Failure, Stream<ChatMessage>> onReceiveMessage(String idUser);
}
