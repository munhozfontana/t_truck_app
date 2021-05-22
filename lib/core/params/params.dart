import 'package:equatable/equatable.dart';
import 'package:t_truck_app/features/domain/entites/credential_entity.dart';
import 'package:t_truck_app/features/domain/entites/image_entity.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';
import 'package:t_truck_app/features/domain/entites/product_entity.dart';
import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';
import 'package:t_truck_app/features/presentation/components/btn_occurrence.dart';

class Params extends Equatable {
  final CredentialEntity? credential;
  final String? token;
  final List<TransacaoVendaEntity>? listIdentificacao;
  final OrderEntity? orderEntity;
  final ImageEntity? imageEntity;
  final List<ProductEntity>? listProductEntity;
  final String? codmot;
  final String? motivoDevolucao;
  final TypeOccurrence? typeOccurrence;

  Params({
    this.credential,
    this.token,
    this.listIdentificacao,
    this.orderEntity,
    this.imageEntity,
    this.listProductEntity,
    this.codmot,
    this.motivoDevolucao,
    this.typeOccurrence,
  });

  @override
  List<Object> get props => [
        credential!,
        token!,
        listIdentificacao!,
        orderEntity!,
        imageEntity!,
        listProductEntity!,
        codmot!,
        motivoDevolucao!,
        typeOccurrence!,
      ];
}
