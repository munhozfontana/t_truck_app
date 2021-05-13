import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_payment_external.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_payment_repository.dart';

class PaymentRepository implements IPaymentRepository {
  IPaymentExternal iPaymentExternal;

  PaymentRepository({
    required this.iPaymentExternal,
  });

  @override
  Future<Either<Failure, void>> pay(List<OrderEntity> listOrderEntity) async {
    try {
      return Right(await iPaymentExternal.pay(listOrderEntity));
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
