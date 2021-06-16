import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/client_model.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/product_receipt_model.dart';
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
    return (await iPaymentRepository.getPayments()).fold(
      (l) => Left(AppFailure(detail: 'Erro ao recuperar os pagamentos')),
      (r) => _doPayment(r, params.clientModel!),
    );
  }

  Either<Failure, void> _doPayment(
      List<ProductReceiptModel> list, ClientModel clientModel) {
    if (list.isEmpty) {
      iPaymentRepository.savePayments(
        clientModel.copyWith(
          receipts: list,
        ),
      );
      return Right(Future.value());
    } else {
      return Left(AppFailure(detail: 'Nenhum pagamento foi realizado'));
    }
  }
}
