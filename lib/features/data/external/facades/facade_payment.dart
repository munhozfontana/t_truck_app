import 'package:t_truck_app/features/data/external/adapters/i_payment_external.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';

class FacadePayment implements IPaymentExternal {
  @override
  Future<PaymentResponse> pay(List<OrderEntity> listOrderEntity) {
    // TODO: implement pay
    throw UnimplementedError();
  }
}
