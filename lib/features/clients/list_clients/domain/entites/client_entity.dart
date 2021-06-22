import 'package:t_truck_app/core/utils/base_entity.dart';

import '../../../list_products/data/models/product_model.dart';

class ClientEntity extends BaseEntity {
  final String name;
  final int qtde;
  final bool show;
  final List<ProductModel> produtos;

  ClientEntity({
    this.name = 'Não encontrado',
    this.produtos = const [],
    this.qtde = 0,
    this.show = true,
  });
}
