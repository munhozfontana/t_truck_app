import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_order_external.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/data/models/order_model.dart';
import 'package:t_truck_app/features/data/repository/order_repository.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_order_repository.dart';

class PaymentRepository extends OrderRepository
    implements IOrderPaymentRepository {
  @override
  final IOrderExternal iOrderExternal;

  @override
  ILoggedUser iLoggedUser;

  PaymentRepository({
    required this.iOrderExternal,
    required this.iLoggedUser,
  }) : super(
          iOrderExternal: iOrderExternal,
          iLoggedUser: iLoggedUser,
        );

  @override
  Future<Either<Failure, void>> pay(OrderEntity orderEntity) async {
    try {
      var orderToCielo = OrderModel.orderToCielo(orderEntity);

      await CieloRun().pay(orderToCielo);

      return Right(Future.value());
    } on ApiException catch (e) {
      return Left(AppFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
