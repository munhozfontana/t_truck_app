import 'package:equatable/equatable.dart';
import 'package:t_truck_app/features/domain/entites/credential_entity.dart';
import 'package:t_truck_app/features/domain/entites/image_entity.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';

class Params extends Equatable {
  final CredentialEntity? credential;
  final String? token;
  final List<TransacaoVendaEntity>? listIdentificacao;
  final OrderEntity? orderEntity;
  final ImageEntity? imageEntity;

  Params({
    this.credential,
    this.token,
    this.listIdentificacao,
    this.orderEntity,
    this.imageEntity,
  });

  @override
  List<Object> get props => [
        credential!,
        token!,
        listIdentificacao!,
        orderEntity!,
        imageEntity!,
      ];
}
