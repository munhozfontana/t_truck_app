import '../../../list_products/domain/entites/product_entity.dart';

class ClientEntity {
  final String id;
  final int clientId;
  final String name;
  final int qtde;
  final bool show;
  final List<ProductEntity> produtos;

  ClientEntity({
    this.id = '',
    this.clientId = 0,
    this.name = 'Não encontrado',
    this.produtos = const [],
    this.qtde = 0,
    this.show = true,
  });
}
