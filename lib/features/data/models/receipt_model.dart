import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:t_truck_app/features/data/external/channels/cielo_channel.dart';
import 'package:t_truck_app/features/data/models/transacao_venda_model.dart';
import 'package:t_truck_app/features/domain/entites/order_entity.dart';

class ReceiptModel extends TransacaoVendaModel {
  @override
  int numTransVenda;
  @override
  int numNota;
  @override
  final int? valor;
  @override
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

  ReceiptModel({
    required this.numTransVenda,
    required this.numNota,
    this.valor,
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
  }) : super(
          numTransVenda: numTransVenda,
          numNota: numNota,
          valor: valor,
          prest: prest,
        );

  static List<ReceiptModel>? cieloAndOrderToReceiptModel(
      PayResponse payment, OrderEntity orderEntity) {
    var paymentFields = (payment.payments as List<dynamic>);
    var firstPayment = paymentFields[0];
    return orderEntity.identificacoes
        .map(
          (e) => ReceiptModel(
            numTransVenda: e.numTransVenda,
            prest: '',
            codCob: firstPayment['paymentFields']['primaryProductName'],
            codCoborig: firstPayment['paymentFields']['secondaryProductName'],
            valor: payment.paidAmount,
            prestTef:
                int.parse(firstPayment['paymentFields']['numberOfQuotas']),
            //nsuTef: '11111',
            nsuTef: firstPayment['cieloCode'],
            codAutorizacaoTef: firstPayment['authCode'],
            codAdmCartao: '00125',
            tipoOperacaoTef: firstPayment['paymentFields']['v40Code'],
            valorJuros:
                int.parse(firstPayment['paymentFields']['interestAmount']),
            idTransacao: firstPayment['paymentFields']['paymentTransactionId'],
            conector: 'CIELO',
            jsonCielo: jsonEncode(paymentFields),
            codBandeira: 1,
            dataDesd: '',
            exportado: 'N',
            dataPagamento: DateFormat('dd/MM/yyyy HH:mm:ss')
                .format(DateTime.now())
                .toString(),
            numNota: e.numNota,
          ),
        )
        .toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'numtransvenda': numTransVenda,
      'numnota': numNota,
      'prest': prest.isEmpty ? 1 : prest,
      'codcob': codCob,
      'codcoborig': codCoborig,
      'data_pagamento': dataPagamento,
      'valor': valor,
      'presttef': prestTef,
      'nsutef': nsuTef,
      'codautorizacaotef': codAutorizacaoTef,
      'codadmcartao': codAdmCartao,
      'json_cielo': jsonCielo,
      'tipooperacaotef': tipoOperacaoTef,
      'valorjuros': valorJuros,
      'idtransacao': idTransacao,
      'conector': conector,
      'codbandeira': codBandeira,
    };
  }

  factory ReceiptModel.fromMap(Map<String, dynamic> map) {
    return ReceiptModel(
      numTransVenda: map['numtransvenda'],
      numNota: map['numnota'],
      valor: map['valor'],
      prest: map['prest'],
      codCob: map['codcob'],
      codCoborig: map['codcoborig'],
      prestTef: map['presttef'],
      nsuTef: map['nsutef'],
      codAutorizacaoTef: map['codautorizacaotef'],
      codAdmCartao: map['codadmcartao'],
      tipoOperacaoTef: map['tipooperacaotef'],
      valorJuros: map['valorjuros'],
      idTransacao: map['idtransacao'],
      conector: map['conector'],
      jsonCielo: map['jsoncielo'],
      codBandeira: map['codbandeira'],
      dataDesd: map['data_desd'],
      exportado: map['exportado'],
      dataPagamento: map['data_pagamento'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReceiptModel.fromJson(String source) =>
      ReceiptModel.fromMap(json.decode(source));
}
