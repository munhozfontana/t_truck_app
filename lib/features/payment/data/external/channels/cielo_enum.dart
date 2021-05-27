enum Payment {
  DEBITO_AVISTA,
  DEBITO_PREDATADO,
  CREDITO_AVISTA,
  CREDITO_PARCELADO_LOJA,
  CREDITO_PARCELADO_ADM,
  PRE_AUTORIZACAO,
  VOUCHER_ALIMENTACAO,
  VOUCHER_REFEICAO,
  VISAVALE_REFEICAO,
  VISAVALE_ALIMENTACAO,
}

extension PaymentCode on Payment {
  int get code {
    switch (this) {
      case Payment.DEBITO_AVISTA:
        return 0x0101;
      case Payment.DEBITO_PREDATADO:
        return 0x0102;
      case Payment.CREDITO_AVISTA:
        return 0x0201;
      case Payment.CREDITO_PARCELADO_LOJA:
        return 0x0202;
      case Payment.CREDITO_PARCELADO_ADM:
        return 0x0203;
      case Payment.PRE_AUTORIZACAO:
        return 0x0301;
      case Payment.VOUCHER_ALIMENTACAO:
        return 0x0401;
      case Payment.VOUCHER_REFEICAO:
        return 0x0402;
      case Payment.VISAVALE_REFEICAO:
        return 0x0501;
      case Payment.VISAVALE_ALIMENTACAO:
        return 0x0502;
    }
  }
}
