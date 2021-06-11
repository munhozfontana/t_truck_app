class TypePayment {
  bool isCreditCard;
  bool isBoleto;
  bool isWallet;
  bool isBonus;

  TypePayment({
    this.isCreditCard = false,
    this.isBoleto = false,
    this.isWallet = false,
    this.isBonus = false,
  });
}
