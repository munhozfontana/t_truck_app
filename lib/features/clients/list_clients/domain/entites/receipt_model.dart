import 'package:t_truck_app/features/clients/list_products/data/models/payment_type_gsa.dart';
import 'package:t_truck_app/features/payment/data/external/channels/cielo_channel.dart';

class ReceipModel extends PaymentTypeGSA {
  @override
  int? numTransVenda;
  @override
  int? numCar;
  @override
  String? dtSaida;
  @override
  bool? isBoleto;
  @override
  bool? isCartao;
  @override
  num? valorCartao;
  @override
  num? valorBoleto;
  @override
  num? valorBonificado;
  @override
  num? valorCarteira;

  final String prest;
  final String? codCob;
  final String? codCoborig;
  final int? prestTef;
  final String? nsuTef;
  final String? codAutorizacaoTef;
  final String? codAdmCartao;
  final String? tipoOperacaoTef;
  final int? valorJuros;
  final String? idTransacao;
  final String? conector;
  final String? jsonCielo;
  final int? codBandeira;
  final String? dataDesd;
  final String? exportado;
  final String? dataPagamento;
  ReceipModel({
    this.numTransVenda,
    this.numCar,
    required this.dtSaida,
    required this.isBoleto,
    this.isCartao,
    this.valorCartao,
    this.valorBoleto,
    this.valorBonificado,
    this.valorCarteira,
    required this.prest,
    this.codCob,
    this.codCoborig,
    this.prestTef,
    this.nsuTef,
    this.codAutorizacaoTef,
    this.codAdmCartao,
    this.tipoOperacaoTef,
    this.valorJuros,
    this.idTransacao,
    this.conector,
    this.jsonCielo,
    this.codBandeira,
    this.dataDesd,
    this.exportado,
    this.dataPagamento,
  });

  static List<ReceipModel> fromListCielo(PayResponse payResponse) {
    return [];
  }

  // static List<ReceiptModel>? cieloAndOrderToReceiptModel(
  //     PayResponse payment, OrderEntity orderEntity) {
  //   var listReceiptModel = <ReceiptModel>[];

  //   var paymentFields = (payment.payments as List<dynamic>);

  //   paymentFields.forEach((firstPayment) {
  //     var listIdentificacoesWithNsu = orderEntity.identificacoes.map(
  //       (e) {
  //         return ReceiptModel(
  //           numTransVenda: e.numTransVenda,
  //           prest: '',
  //           codCob: firstPayment['paymentFields']['primaryProductName'],
  //           codCoborig: firstPayment['paymentFields']['secondaryProductName'],
  //           valor: payment.paidAmount,
  //           prestTef:
  //               int.parse(firstPayment['paymentFields']['numberOfQuotas']),
  //           //nsuTef: '11111',
  //           nsuTef: firstPayment['cieloCode'],
  //           codAutorizacaoTef: firstPayment['authCode'],
  //           codAdmCartao: '00125',
  //           tipoOperacaoTef: firstPayment['paymentFields']['v40Code'],
  //           valorJuros:
  //               int.parse(firstPayment['paymentFields']['interestAmount']),
  //           idTransacao: firstPayment['paymentFields']['paymentTransactionId'],
  //           conector: 'CIELO',
  //           jsonCielo: jsonEncode(paymentFields),
  //           codBandeira: 1,
  //           dataDesd: '',
  //           exportado: 'N',
  //           dataPagamento: DateFormat('dd/MM/yyyy HH:mm:ss')
  //               .format(DateTime.now())
  //               .toString(),
  //           numNota: e.numNota,
  //         );
  //       },
  //     ).toList();

  //     listReceiptModel.addAll(listIdentificacoesWithNsu);
  //   });

  //   return listReceiptModel;
  // }

  // @override
  // Map<String, dynamic> toMap() {
  //   return {
  //     'numtransvenda': numTransVenda,
  //     'numnota': numNota,
  //     'prest': prest.isEmpty ? 1 : prest,
  //     'codcob': codCob,
  //     'codcoborig': codCoborig,
  //     'data_pagamento': dataPagamento,
  //     'valor': valor,
  //     'presttef': prestTef,
  //     'nsutef': nsuTef,
  //     'codautorizacaotef': codAutorizacaoTef,
  //     'codadmcartao': codAdmCartao,
  //     'json_cielo': jsonCielo,
  //     'tipooperacaotef': tipoOperacaoTef,
  //     'valorjuros': valorJuros,
  //     'idtransacao': idTransacao,
  //     'conector': conector,
  //     'codbandeira': codBandeira,
  //   };
  // }

  // factory ReceiptModel.fromMap(Map<String, dynamic> map) {
  //   return ReceiptModel(
  //     numTransVenda: map['numtransvenda'],
  //     numNota: map['numnota'],
  //     valor: map['valor'],
  //     prest: map['prest'],
  //     codCob: map['codcob'],
  //     codCoborig: map['codcoborig'],
  //     prestTef: map['presttef'],
  //     nsuTef: map['nsutef'],
  //     codAutorizacaoTef: map['codautorizacaotef'],
  //     codAdmCartao: map['codadmcartao'],
  //     tipoOperacaoTef: map['tipooperacaotef'],
  //     valorJuros: map['valorjuros'],
  //     idTransacao: map['idtransacao'],
  //     conector: map['conector'],
  //     jsonCielo: map['jsoncielo'],
  //     codBandeira: map['codbandeira'],
  //     dataDesd: map['data_desd'],
  //     exportado: map['exportado'],
  //     dataPagamento: map['data_pagamento'],
  //   );
  // }

  // @override
  // String toJson() => json.encode(toMap());

  // factory ReceiptModel.fromJson(String source) =>
  //     ReceiptModel.fromMap(json.decode(source));

  // static List<ReceiptEntity> fromCielo(PayResponse payResponse) {}
}
