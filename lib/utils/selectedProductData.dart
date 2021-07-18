import 'package:flutter/cupertino.dart';

class SelectedProductData extends ChangeNotifier{

  String _productId;
  String _productName;
  String _category;
  String _description;
  String _price;
  bool _isFav = false;

  String get productID => _productId;
  set productId(String productId){
    _productId = productId;
    notifyListeners();
  }
  String get productName => _productName;
  set productName(String productName){
    _productName = productName;
    notifyListeners();
  }
  String get category => _category;
  set category(String category){
    _category = category;
    notifyListeners();
  }
  String get description => _description;
  set description(String description){
    _description = description;
    notifyListeners();
  }
  String get price => _price;
  set price(String price){
    _price = price;
    notifyListeners();
  }

  bool get isFav => _isFav;
  set isFav(bool isFav){
    _isFav = isFav;
    notifyListeners();
  }
}