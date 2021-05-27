import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/use_case.dart';
import 'package:t_truck_app/features/domain/entites/clients.dart';
import 'package:t_truck_app/features/domain/repositories/i_order_repository.dart';

class OrderListUseCase implements UseCaseAsync<Type, Params> {
  IOrderRepository iOrderListRepository;

  OrderListUseCase({
    required this.iOrderListRepository,
  });

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
