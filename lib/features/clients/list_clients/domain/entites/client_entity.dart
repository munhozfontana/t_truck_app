import 'package:t_truck_app/features/clients/list_products/domain/entites/product_entity.dart';

class ClientEntity {
  final String id;
  final int clientId;
  final String name;
  final List<ProductEntity> produtos;
  final int qtde;
  final bool show;

  ClientEntity({
    required this.id,
    required this.clientId,
    required this.name,
    required this.produtos,
    required this.qtde,
    this.show = true,
  });

  ClientEntity copyWith({
    String? id,
    int? clientId,
    String? name,
    List<ProductEntity>? produtos,
    int? qtde,
    bool? show,
  }) {
    return ClientEntity(
      id: id ?? this.id,
      clientId: clientId ?? this.clientId,
      name: name ?? this.name,
      produtos: produtos ?? this.produtos,
      qtde: qtde ?? this.qtde,
      show: show ?? this.show,
    );
  }
}
