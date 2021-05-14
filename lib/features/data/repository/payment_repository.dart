import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:t_truck_app/core/error/failures.dart';
import 'package:t_truck_app/features/data/external/adapters/i_order_external.dart';
import 'package:t_truck_app/features/data/external/adapters/i_receipt_external.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_driver.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_enum.dart';
import 'package:t_truck_app/features/data/repository/order_repository.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/repositories/i_order_repository.dart';

class PaymentRepository extends OrderRepository
    implements IOrderPaymentRepository {
  @override
  final IOrderExternal iOrderExternal;
  final CieloDriver cieloDriver;
  final IReceiptExternal iReceiptExternal;

  PaymentRepository({
    required this.cieloDriver,
    required this.iReceiptExternal,
    required this.iOrderExternal,
  }) : super(
          iOrderExternal: iOrderExternal,
        );

  @override
  Future<Either<Failure, void>> pay(OrderEntity orderEntity) async {
    // var resFromCielo =
    //     await cieloDriver.payCielo(OrderModel.orderToCielo(orderEntity));

    // var listReceiptModel = ReceiptModel.cieloAndOrderToReceiptModel(
    //   resFromCielo,
    //   orderEntity,
    // );
    // await iReceiptExternal.save(listReceiptModel);
    callPay();
    return Right(null);
  }

  void callPay() async {
    var cieloCredentials = CieloCredentials()
      ..clientID = env['CLIENT_ID_CIELO']
      ..accessToken = env['ACCESS_TOKEN_CIELO'];

    var arg = PayParam()
      ..reference = 'MINHA REFERENCIA FLUTTER'
      ..cieloCredentials = cieloCredentials
      ..valorTotal = 500000
      ..paymentCode = Payment.CREDITO_AVISTA.code
      ..installments = 5
      // ..email = "teste@gmail.com"
      ..items = [
        {
          'sku': '2891820317391823',
          'name': 'coca',
          'unitPrice': 550,
          'quantity': 1,
          'unitOfMeasure': 'UNIT',
        }
      ];

    var res = await CieloRun().pay(arg);
    print(res);
  }
}
