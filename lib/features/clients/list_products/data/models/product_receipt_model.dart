import 'dart:convert';

import 'package:intl/intl.dart';

import '../../../../payment/data/external/channels/cielo_channel.dart';
import 'product_model.dart';

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
  }) : super(
          id: '',
          maxQuantity: 0,
          name: '',
          quantity: 0,
          show: false,
          codProd: 0,
          numTransVenda: 0,
        );

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
      'dataPagamento': dataPagamento,
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

  String toJson() => json.encode(toMap());

  static List<String> listToJson(List<ProductReceiptModel> list) {
    return list.map((e) => e.toJson()).toList();
  }
}
