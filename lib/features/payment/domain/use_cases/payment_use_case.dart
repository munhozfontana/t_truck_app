import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../../../../core/use_case.dart';

class OrderPayUseCase implements UseCaseAsync<Type, Params> {
  // IOrderPaymentRepository iOrderPayRepository;

  @override
  Future<Either<Failure, void>> call(Params params) async {
    // return iOrderPayRepository.pay(params.orderEntity!);
    return Future.value();
  }
}
