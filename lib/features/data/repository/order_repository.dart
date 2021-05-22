import 'package:dartz/dartz.dart';
import 'package:t_truck_app/core/error/api_exception.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/core/messages/api_mensages.dart';
import 'package:t_truck_app/features/data/external/adapters/i_jwt_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_local_store_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_order_external.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_order_repository.dart';

class OrderRepository implements IOrderRepository {
  IOrderExternal iOrderExternal;
  ILoggedUser iLoggedUser;

  OrderRepository({
    required this.iOrderExternal,
    required this.iLoggedUser,
  });

  @override
  Future<Either<Failure, List<OrderEntity>>> list() async {
    try {
      var codigoMotorista = await iLoggedUser.login;
      return Right(await iOrderExternal.list(codigoMotorista));
    } on ApiException catch (e) {
      return Left(RequestFailure(detail: e.error));
    } catch (e) {
      return Left(AppFailure(detail: ApiMensages.GENERIC_ERROR));
    }
  }
}

class LoggedUser implements ILoggedUser {
  final IJwt iJwt;
  final ILocalStoreExternal iLocalStoreExternal;

  LoggedUser({
    required this.iJwt,
    required this.iLocalStoreExternal,
  });

  @override
  Future<String> get login async {
    var token = await iLocalStoreExternal.take('token');
    return iJwt.jwtDecode(token as String)['login'];
  }

  @override
  Future<bool> get loginExpired async {
    var token = await iLocalStoreExternal.take('token');
    return iJwt.isExpired(token as String);
  }
}

mixin ILoggedUser {
  Future<String> get login;
  Future<bool> get loginExpired;
}
