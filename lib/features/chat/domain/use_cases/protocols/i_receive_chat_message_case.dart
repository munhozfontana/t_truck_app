import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/chat/domain/entities/chat_message_entity.dart';

abstract class IReceiveChatMessageCase {
  Either<Failure, Stream<ChatMessage>> call(Params params);
}
