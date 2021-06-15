import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/client_model.dart';

mixin IPaymentRepository {
  Future<Either<Failure, void>> open(ClientModel? clientEntity);
}
