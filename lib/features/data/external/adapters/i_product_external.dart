import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';

mixin IProductExternal {
  Future<List<ProductEntity>> list(List<TransacaoVendaEntity> list);
}
