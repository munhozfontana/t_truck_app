import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../../../../core/use_case.dart';
import '../../../clients/list_clients/data/models/client_model.dart';
import '../../../clients/list_products/data/models/product_receipt_model.dart';
import '../repositories/payment_repository.dart';

class SavePaymentUseCase implements UseCaseAsync<Type, Params> {
  IPaymentRepository iPaymentRepository;

  SavePaymentUseCase({
    required this.iPaymentRepository,
  });

  @override
  Future<Either<Failure, List<ProductReceiptModel>>> call(Params params) async {
    return (await iPaymentRepository.getPayments()).fold(
      (l) => Left(AppFailure(detail: 'Erro ao recuperar os pagamentos')),
      (r) => _doPayment(r, params.clientModel!),
    );
  }

  Future<Either<Failure, List<ProductReceiptModel>>> _doPayment(
      List<ProductReceiptModel> list, ClientModel clientModel) async {
    if (list.isNotEmpty) {
      var listReceiptsWithTransVenda = <ProductReceiptModel>[];
      clientModel.paymentTypeGsa!.forEach((element) {
        listReceiptsWithTransVenda.addAll(
            list.map((e) => e.copyWith(numTransVenda: element.numTransVenda)));
      });
      await iPaymentRepository.savePayments(
        clientModel.copyWith(
          receipts: listReceiptsWithTransVenda,
        ),
      );
      return Right(list);
    } else {
      return Left(AppFailure(detail: 'Nenhum pagamento foi realizado'));
    }
  }
}
