class Card {
  String _cardNumber;
  String _cvv;
  String _expirationDate;

  
  String get cardNumber => _cardNumber;

  set cardNumber(String value) => _cardNumber = value;

  String get cvv => _cvv;

  set cvv(String value) => _cvv = value;

  String get expirationDate => _expirationDate;

  set expirationDate(String value) => _expirationDate = value;
}
