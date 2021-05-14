import 'dart:convert';

class OrderDatabaseEntity {
  int? numtransvenda;
  String? prest;
  String? codcob;
  String? codcoborig;
  int? valor;
  int? presttef;
  String? nsutef;
  String? codautorizacaotef;
  String? codadmcartao;
  String? tipooperacaotef;
  int? valorjuros;
  String? idtransacao;
  String? conector;
  String? JSON_CIELO;
  int? codbandeira;
  String? data_desd;
  String? exportado;
  String? data_pagamento;

  OrderDatabaseEntity({
    this.numtransvenda,
    this.prest,
    this.codcob,
    this.codcoborig,
    this.valor,
    this.presttef,
    this.nsutef,
    this.codautorizacaotef,
    this.codadmcartao,
    this.tipooperacaotef,
    this.valorjuros,
    this.idtransacao,
    this.conector,
    this.JSON_CIELO,
    this.codbandeira,
    this.data_desd,
    this.exportado,
    this.data_pagamento,
  });

  Map<String, dynamic> toMap() {
    return {
      'numtransvenda': numtransvenda,
      'prest': prest,
      'codcob': codcob,
      'codcoborig': codcoborig,
      'valor': valor,
      'presttef': presttef,
      'nsutef': nsutef,
      'codautorizacaotef': codautorizacaotef,
      'codadmcartao': codadmcartao,
      'tipooperacaotef': tipooperacaotef,
      'valorjuros': valorjuros,
      'idtransacao': idtransacao,
      'conector': conector,
      'JSON_CIELO': JSON_CIELO,
      'codbandeira': codbandeira,
      'data_desd': data_desd,
      'exportado': exportado,
      'data_pagamento': data_pagamento,
    };
  }

  factory OrderDatabaseEntity.fromMap(Map<String, dynamic> map) {
    return OrderDatabaseEntity(
      numtransvenda: map['numtransvenda'],
      prest: map['prest'],
      codcob: map['codcob'],
      codcoborig: map['codcoborig'],
      valor: map['valor'],
      presttef: map['presttef'],
      nsutef: map['nsutef'],
      codautorizacaotef: map['codautorizacaotef'],
      codadmcartao: map['codadmcartao'],
      tipooperacaotef: map['tipooperacaotef'],
      valorjuros: map['valorjuros'],
      idtransacao: map['idtransacao'],
      conector: map['conector'],
      JSON_CIELO: map['JSON_CIELO'],
      codbandeira: map['codbandeira'],
      data_desd: map['data_desd'],
      exportado: map['exportado'],
      data_pagamento: map['data_pagamento'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderDatabaseEntity.fromJson(String source) =>
      OrderDatabaseEntity.fromMap(json.decode(source));
}
