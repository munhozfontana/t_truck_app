import 'package:t_truck_app/features/domain/entites/order_entity.dart';

mixin IOrderExternal {
  Future<List<OrderEntity>> list(String codMotorista);
}
