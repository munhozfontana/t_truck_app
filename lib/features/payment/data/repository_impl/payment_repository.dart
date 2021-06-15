import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/client_model.dart';
import 'package:t_truck_app/features/payment/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/payment/domain/repositories/payment_repository.dart';

class PaymentRepository implements IPaymentRepository {
  @override
  Future<Either<Failure, void>> open(ClientModel? clientEntity) async {
    try {
      return Right(CieloRun().pay(ClientModel.orderToCielo(clientEntity)));
    } on ApiException catch (e) {
      return Left(AppFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
