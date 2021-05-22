import 'package:flutter/foundation.dart';
import 'package:t_truck_app/features/domain/entites/transacao_venda_entity.dart';

class OrderEntity {
  final String? dtCanhato;
  final String cliente;
  final int codCli;
  final int numCar;
  final String dtSaida;
  final List<TransacaoVendaEntity> identificacoes;

  OrderEntity({
    this.dtCanhato,
    required this.cliente,
    required this.codCli,
    required this.identificacoes,
    required this.numCar,
    required this.dtSaida,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderEntity &&
        other.dtCanhato == dtCanhato &&
        other.cliente == cliente &&
        other.codCli == codCli &&
        other.numCar == numCar &&
        other.dtSaida == dtSaida &&
        listEquals(other.identificacoes, identificacoes);
  }

  @override
  int get hashCode {
    return dtCanhato.hashCode ^
        cliente.hashCode ^
        codCli.hashCode ^
        numCar.hashCode ^
        dtSaida.hashCode ^
        identificacoes.hashCode;
  }

  OrderEntity copyWith({
    String? dtCanhato,
    String? cliente,
    int? codCli,
    int? numCar,
    String? dtSaida,
    List<TransacaoVendaEntity>? identificacoes,
  }) {
    return OrderEntity(
      dtCanhato: dtCanhato ?? this.dtCanhato,
      cliente: cliente ?? this.cliente,
      codCli: codCli ?? this.codCli,
      numCar: numCar ?? this.numCar,
      dtSaida: dtSaida ?? this.dtSaida,
      identificacoes: identificacoes ?? this.identificacoes,
    );
  }
}
