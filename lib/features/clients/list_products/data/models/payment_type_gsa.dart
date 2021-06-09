import 'dart:convert';

class PaymentTypeGSA {
  int? numTransVenda;
  int? numCar;
  String? dtSaida;
  bool? isBoleto;
  bool? isCartao;
  num? valorCartao;
  num? valorBoleto;
  num? valorBonificado;
  num? valorCarteira;
  PaymentTypeGSA({
    this.numTransVenda,
    this.numCar,
    this.dtSaida,
    this.isBoleto,
    this.isCartao,
    this.valorCartao,
    this.valorBoleto,
    this.valorBonificado,
    this.valorCarteira,
  });

  Map<String, dynamic> toMap() {
    return {
      'NUMTRANSVENDA': numTransVenda,
      'NUMCAR': numCar,
      'DTSAIDA': dtSaida,
      'ISBOLETO': isBoleto,
      'ISCARTAO': isCartao,
      'VALORCARTAO': valorCartao,
      'VALORBOLETO': valorBoleto,
      'VALORBONIFICADO': valorBonificado,
      'VALORCARTEIRA': valorCarteira,
    };
  }

  factory PaymentTypeGSA.fromMap(Map<String, dynamic> map) {
    return PaymentTypeGSA(
      numTransVenda: map['NUMTRANSVENDA'],
      numCar: map['NUMCAR'],
      dtSaida: map['DTSAIDA'],
      isBoleto: map['ISBOLETO'],
      isCartao: map['ISCARTAO'],
      valorCartao: map['VALORCARTAO'],
      valorBoleto: map['VALORBOLETO'],
      valorBonificado: map['VALORBONIFICADO'],
      valorCarteira: map['VALORCARTEIRA'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentTypeGSA.fromJson(String source) =>
      PaymentTypeGSA.fromMap(json.decode(source));
}
