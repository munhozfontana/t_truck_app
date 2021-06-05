import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/data/external/adapters/i_receipt_external.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/data/models/receipt_model.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_recipt_repository.dart';

class ReciptRepository implements IReciptRepository {
  final IReceiptExternal iReceiptExternal;

  ReciptRepository({required this.iReceiptExternal});

  @override
  Future<Either<Failure, void>> save(OrderEntity orderEntity) async {
    var resFromCielo = await CieloRun().responsePayments();

    var listReceipt = ReceiptModel.cieloAndOrderToReceiptModel(
      resFromCielo,
      orderEntity,
    );
    if (!GetUtils.isNull(listReceipt)) {
      return Right(await iReceiptExternal.save(listReceipt!));
    } else {
      return Left(AppFailure(detail: 'Erro ao recuperar dados da cielo'));
    }
  }
}
