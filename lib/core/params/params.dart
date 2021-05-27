import 'package:equatable/equatable.dart';

import '../../features/login/domain/entites/credential_entity.dart';

class Params extends Equatable {
  final CredentialEntity? credential;
  final String? token;
  // final List<TransacaoVendaEntity>? listIdentificacao;
  // final OrderEntity? orderEntity;
  // final ImageEntity? imageEntity;
  // final List<ProductEntity>? listProductEntity;
  final String? codmot;
  final String? motivoDevolucao;
  // final TypeOccurrence? typeOccurrence;

  Params({
    this.credential,
    this.token,
    // this.listIdentificacao,
    // this.orderEntity,
    // this.imageEntity,
    // this.listProductEntity,
    this.codmot,
    this.motivoDevolucao,
    // this.typeOccurrence,
  });

  @override
  List<Object> get props => [
        credential!,
        token!,
        // listIdentificacao!,
        // orderEntity!,
        // imageEntity!,
        // listProductEntity!,
        codmot!,
        motivoDevolucao!,
      ];
}
