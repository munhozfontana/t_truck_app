import 'package:uuid/uuid.dart';

import '../../../list_products/data/models/product_model.dart';

class ClientEntity {
  String id;
  final String name;
  final int qtde;
  final bool show;
  final List<ProductModel> produtos;

  ClientEntity({
    this.id = '',
    this.name = 'Não encontrado',
    this.produtos = const [],
    this.qtde = 0,
    this.show = true,
  }) {
    id = Uuid().v4();
  }
}
