import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/use_case.dart';
import '../entites/client_entity.dart';

class ClientListUseCase implements UseCaseAsync<Type, Params> {
  @override
  Future<Either<Failure, List<ClientEntity>>> call(Params params) async {
    return Right([
      ClientEntity()
        ..id = '1'
        ..invoices = []
        ..name = 'anyNamy'
    ]);
  }
}
