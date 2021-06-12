import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/params/params.dart';
import 'package:t_truck_app/core/use_case.dart';
import 'package:t_truck_app/features/payment/domain/entites/type_payment.dart';

class IdentifyTypePaymentCase implements UseCase<Type, Params> {
  @override
  Either<Failure, TypePayment> call(Params params) {
    var paymentType = params.clinetModel!.paymentTypeGsa;
    var typePayment = TypePayment(
        isBonus: paymentType!
            .where(
              (element) => element.valorBonificado! > 0,
            )
            .isNotEmpty,
        isCreditCard: paymentType
            .where(
              (element) => element.valorCartao! > 0,
            )
            .isNotEmpty,
        isBoleto: paymentType
            .where(
              (element) => element.valorBoleto! > 0,
            )
            .isNotEmpty,
        isWallet: paymentType
            .where(
              (element) => element.valorCarteira! > 0,
            )
            .isNotEmpty);

    return Right(typePayment);
  }
}
