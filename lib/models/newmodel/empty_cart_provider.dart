import 'package:flutter/foundation.dart';

class EmptyCart extends ChangeNotifier {
  bool _isEmptyCart = false;
  bool get isEmptyCart => _isEmptyCart;
  set isEmptyCart(bool status) {
    _isEmptyCart = status;
    notifyListeners();
  }
}