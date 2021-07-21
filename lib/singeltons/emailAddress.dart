import 'package:flutter/cupertino.dart';

class EmailProvider extends ChangeNotifier{

  String _emailAddress;
  String _password;

  String get emailAddress => _emailAddress;
  set emailAddress (String emailAddress){
    _emailAddress = emailAddress;
    notifyListeners();
  }

  String get password => _password;
  set password(String password){
    _password = password;
    notifyListeners();
  }


}