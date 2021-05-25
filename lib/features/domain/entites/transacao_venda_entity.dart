import 'package:uuid/uuid.dart';

class TransacaoVendaEntity extends ListHelper {
  final int numTransVenda;
  final int numNota;
  final num? valor;
  final String prest;

  TransacaoVendaEntity({
    required this.numTransVenda,
    required this.numNota,
    this.valor,
    required this.prest,
  }) : super('');

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TransacaoVendaEntity &&
        other.numTransVenda == numTransVenda &&
        other.numNota == numNota;
  }

  @override
  int get hashCode {
    return numTransVenda.hashCode ^ numNota.hashCode;
  }
}

class ListHelper {
  String uuid;
  bool hidden;

  ListHelper(
    this.uuid, {
    this.hidden = false,
  }) {
    uuid = Uuid().v4();
  }
}
