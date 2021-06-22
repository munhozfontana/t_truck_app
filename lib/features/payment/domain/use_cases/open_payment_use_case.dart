import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../../../../core/use_case.dart';
import '../repositories/payment_repository.dart';

class OpenPaymentUseCase implements UseCaseAsync<Type, Params> {
  IPaymentRepository iPaymentRepository;

  OpenPaymentUseCase({
    required this.iPaymentRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return iPaymentRepository.openPayments(params.clientModel);
  }
}
