import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/chat/domain/entities/chat_person_entity.dart';

abstract class IListChatPeopleCase {
  Future<Either<Failure, List<ChatPerson>>> call(Params params);
}
