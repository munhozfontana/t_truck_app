import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:t_truck_app/features/clients/list_products/data/models/product_model.dart';
import 'package:t_truck_app/features/payment/data/external/channels/cielo_channel.dart';

class ProductReceiptModel extends ProductModel {
  @override
  final int numTransVenda;
  final String? prest;
  final String codCob;
  final String codCoborig;
  final int prestTef;
  final String? nsuTef;
  final String? codAutorizacaoTef;
  final String? codAdmCartao;
  final String tipoOperacaoTef;
  final int valorJuros;
  final int valor;
  final String idTransacao;
  final String? conector;
  final int? codBandeira;
  final String? exportado;
  final String dataPagamento;

  ProductReceiptModel({
    this.numTransVenda = 0,
    this.prest = '1',
    required this.codCob,
    required this.codCoborig,
    required this.prestTef,
    this.nsuTef = '11111',
    this.codAutorizacaoTef,
    this.codAdmCartao = '00125',
    required this.tipoOperacaoTef,
    required this.valorJuros,
    required this.valor,
    required this.idTransacao,
    this.conector = 'CIELO',
    this.codBandeira = 1,
    this.exportado = 'N',
    required this.dataPagamento,
  }) : super(id: '');

  static List<ProductReceiptModel> fromListCielo(PayResponse payResponse) {
    return (payResponse.payments as List<dynamic>).map((paymentField) {
      return ProductReceiptModel(
        codCob: paymentField['paymentFields']['primaryProductName'],
        codCoborig: paymentField['paymentFields']['secondaryProductName'],
        prestTef: int.parse(paymentField['paymentFields']['numberOfQuotas']),
        // nsuTef: paymentField['cieloCode'],
        codAutorizacaoTef: paymentField['authCode'],
        tipoOperacaoTef: paymentField['paymentFields']['v40Code'],
        valorJuros: int.parse(paymentField['paymentFields']['interestAmount']),
        idTransacao: paymentField['paymentFields']['paymentTransactionId'],
        dataPagamento: DateFormat('dd/MM/yyyy HH:mm:ss')
            .format(
              DateTime.now(),
            )
            .toString(),
        valor: payResponse.paidAmount ?? 0,
      );
    }).toList();
  }

  Map<String, dynamic> toMap() {
    return {
      'numtransvenda': numTransVenda,
      'prest': prest,
      'codcob': codCob,
      'codcoborig': codCoborig,
      'data_pagamento': dataPagamento,
      'valor': valor,
      'presttef': prestTef,
      'nsutef': nsuTef,
      'codautorizacaotef': codAutorizacaoTef,
      'codadmcartao': codAdmCartao,
      'tipooperacaotef': tipoOperacaoTef,
      'valorjuros': valorJuros,
      'idtransacao': idTransacao,
      'conector': conector,
      'codbandeira': codBandeira,
      'exportado': exportado,
    };
  }

  factory ProductReceiptModel.fromMap(Map<String, dynamic> map) {
    return ProductReceiptModel(
      numTransVenda: map['numTransVenda'],
      prest: map['prest'],
      codCob: map['codCob'],
      codCoborig: map['codCoborig'],
      prestTef: map['prestTef'],
      nsuTef: map['nsuTef'],
      codAutorizacaoTef: map['codAutorizacaoTef'],
      codAdmCartao: map['codAdmCartao'],
      tipoOperacaoTef: map['tipoOperacaoTef'],
      valorJuros: map['valorJuros'],
      valor: map['valor'],
      idTransacao: map['idTransacao'],
      conector: map['conector'],
      codBandeira: map['codBandeira'],
      exportado: map['exportado'],
      dataPagamento: map['dataPagamento'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductReceiptModel.fromJson(String source) =>
      ProductReceiptModel.fromMap(json.decode(source));
}
