import 'package:flutter/cupertino.dart';

class EmailProvider extends ChangeNotifier{

  String _emailAddress;

  String get emailAddress => _emailAddress;
  set emailAddress (String emailAddress){
    _emailAddress = emailAddress;
    notifyListeners();
  }


}