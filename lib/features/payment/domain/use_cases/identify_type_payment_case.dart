import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/use_case.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/product_model.dart';
import 'package:t_truck_app/features/payment/domain/entites/type_payment.dart';

class IdentifyTypePaymentCase implements UseCase<Type, Params> {
  @override
  Either<Failure, TypePayment> call(Params params) {
    var prodocts = params.clientEntity!.produtos;
    var typePayment = TypePayment();

    typePayment
      ..isWallet = prodocts.contains(
        (element) =>
            (element as ProductModel).paymentTypeGsa!.valorCarteira! > 0,
      )
      ..isBonus = prodocts.contains(
        (element) =>
            (element as ProductModel).paymentTypeGsa!.valorBonificado! > 0,
      )
      ..isBoleto = prodocts.contains(
        (element) => (element as ProductModel).paymentTypeGsa!.valorBoleto! > 0,
      )
      ..isCreditCard = prodocts.contains(
        (element) => (element as ProductModel).paymentTypeGsa!.valorCartao! > 0,
      );

    return Right(typePayment);
  }
}
