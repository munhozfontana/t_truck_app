import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/features/chat/domain/entities/chat_person_entity.dart';
import 'package:t_truck_app/features/chat/domain/repositories/i_chat_people_repository.dart';

import 'protocols/i_list_chat_people_case.dart';

class ListChatPeopleCase implements IListChatPeopleCase {
  IChatPeopleRepository iChatPeopleRepository;

  ListChatPeopleCase({
    required this.iChatPeopleRepository,
  });

  @override
  Future<Either<Failure, List<ChatPerson>>> call(Params params) {
    return iChatPeopleRepository.listByToken(1);
  }
}
