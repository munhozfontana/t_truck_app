import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/clients/list_clients/data/models/client_model.dart';
import 'package:t_truck_app/features/payment/data/external/channels/cielo_channel.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/params/params.dart';
import '../../../../core/use_case.dart';

class OpenPaymentUseCase implements UseCaseAsync<Type, Params> {
  IPaymentRepository iPaymentRepository;

  OpenPaymentUseCase({
    required this.iPaymentRepository,
  });

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return iPaymentRepository.open(params.clinetModel!);
  }
}

mixin IPaymentRepository {
  Future<Either<Failure, void>> open(ClientModel? clientEntity);
}

class PaymentRepository implements IPaymentRepository {
  @override
  Future<Either<Failure, void>> open(ClientModel? clientEntity) async {
    try {
      await CieloRun().pay(ClientModel.orderToCielo(clientEntity));
      return Right(Future.value());
    } on ApiException catch (e) {
      return Left(AppFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}
