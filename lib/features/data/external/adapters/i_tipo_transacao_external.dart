import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/entites/tipo_transacao_entity.dart';

mixin ITipoTransacaoExternal {
  Future<List<TipoTransacaoEntity>> getByOrder(OrderEntity orderEntity);
}
