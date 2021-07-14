import 'package:flutter/cupertino.dart';

class SelectedCategoryToShow extends ChangeNotifier{

  String _selectedCategory ;

  String get selectedCategory => _selectedCategory;
  set selectedCategory(String selectedCategory){
    _selectedCategory = selectedCategory;
    notifyListeners();
  }


}