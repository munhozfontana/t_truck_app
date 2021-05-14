import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/use_case.dart';
import 'package:t_truck_app/features/domain/repositories/i_order_repository.dart';

class OrderPayUseCase implements UseCaseAsync<Type, Params> {
  IOrderPaymentRepository iOrderPayRepository;

  OrderPayUseCase({
    required this.iOrderPayRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return iOrderPayRepository.pay(params.orderEntity!);
  }
}
