import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:t_truck_app/features/payment/domain/repositories/payment_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../../../../core/use_case.dart';

class SavePaymentUseCase implements UseCaseAsync<Type, Params> {
  IPaymentRepository iPaymentRepository;

  SavePaymentUseCase({
    required this.iPaymentRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) async {
    var openEither = await iPaymentRepository.getPayments();

    openEither.fold(
      (l) => null,
      (r) {
        if (r.isEmpty) {
          iPaymentRepository.savePayments(r);
        } else {
          return Left(AppFailure(detail: 'Nenhum pagamento foi realizado'));
        }
      },
    );

    return Future.value();
  }
}
