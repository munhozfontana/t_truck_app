import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:t_truck_app/features/payment/data/external/channels/cielo_channel.dart';

import 'product_model.dart';

class ProductReceiptModel extends ProductModel {
  final String? codCob;
  final String? codCoborig;
  final int? prestTef;
  final String nsuTef;
  final String? codAutorizacaoTef;
  final String codAdmCartao;
  final String? tipoOperacaoTef;
  final int? valorJuros;
  final int valor;
  final String? idTransacao;
  final String conector;
  final int codBandeira;
  final String exportado;
  final String dataPagamento;

  ProductReceiptModel({
    int? codProd,
    int? numTransVenda,
    String? name,
    int? maxQuantity,
    int? quantity,
    bool? show,
    this.codCob,
    this.codCoborig,
    this.prestTef,
    this.nsuTef = '11111',
    this.codAutorizacaoTef,
    this.codAdmCartao = '00125',
    this.tipoOperacaoTef,
    this.valorJuros,
    this.valor = 0,
    this.idTransacao,
    this.conector = 'CIELO',
    this.codBandeira = 1,
    this.exportado = 'N',
    required this.dataPagamento,
  }) : super(
          codProd: codProd ?? 0,
          numTransVenda: numTransVenda ?? 0,
          name: name ?? '',
          maxQuantity: maxQuantity ?? 0,
          quantity: quantity ?? 0,
          show: show ?? true,
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

  @override
  ProductReceiptModel copyWith({
    String? prest,
    String? codCob,
    String? codCoborig,
    int? prestTef,
    String? nsuTef,
    String? codAutorizacaoTef,
    String? codAdmCartao,
    String? tipoOperacaoTef,
    int? valorJuros,
    int? valor,
    String? idTransacao,
    String? conector,
    int? codBandeira,
    String? exportado,
    String? dataPagamento,
    int? codProd,
    int? numTransVenda,
    String? name,
    int? maxQuantity,
    int? quantity,
    bool? show,
  }) {
    return ProductReceiptModel(
      codCob: codCob ?? this.codCob,
      codCoborig: codCoborig ?? this.codCoborig,
      prestTef: prestTef ?? this.prestTef,
      nsuTef: nsuTef ?? this.nsuTef,
      codAutorizacaoTef: codAutorizacaoTef ?? this.codAutorizacaoTef,
      codAdmCartao: codAdmCartao ?? this.codAdmCartao,
      tipoOperacaoTef: tipoOperacaoTef ?? this.tipoOperacaoTef,
      valorJuros: valorJuros ?? this.valorJuros,
      valor: valor ?? this.valor,
      idTransacao: idTransacao ?? this.idTransacao,
      conector: conector ?? this.conector,
      codBandeira: codBandeira ?? this.codBandeira,
      exportado: exportado ?? this.exportado,
      dataPagamento: dataPagamento ?? this.dataPagamento,
      codProd: codProd ?? super.codProd,
      maxQuantity: maxQuantity ?? super.maxQuantity,
      name: name ?? super.name,
      numTransVenda: numTransVenda ?? super.numTransVenda,
      quantity: quantity ?? super.quantity,
      show: show ?? super.show,
    );
  }
}
