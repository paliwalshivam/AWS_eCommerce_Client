import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/productModel.dart';

Future<List<ProductModel>> getProductData() async {

  List list ;
  List<ProductModel> listOfProducts = [];
  var response = await http.get(Uri.parse('https://ym1sv9rs28.execute-api.us-east-1.amazonaws.com/production/products'));
  list = jsonDecode(response.body);

  for(int i =0 ; i< list.length ; i++){
    if(list[i]["_version"] == 1){
      listOfProducts.add(
          ProductModel(
            productId: list[i]["id"],
            productName: list[i]["product"],
            category: list[i]["category"],
            description: list[i]["description"],
            price: list[i]["price"],
          )
      );
    }
  }
  return listOfProducts;
}

Future<List<ProductModel>> getSearchedProductData(String searchQuery) async {

  List list ;
  List<ProductModel> listOfProducts = [];
  var response = await http.get(Uri.parse('https://ym1sv9rs28.execute-api.us-east-1.amazonaws.com/production/products'));
  list = jsonDecode(response.body);

  for(int i =0 ; i< list.length ; i++){
    if(list[i]["_version"] == 1){
      listOfProducts.add(
          ProductModel(
            productId: list[i]["id"],
            productName: list[i]["product"],
            category: list[i]["category"],
            description: list[i]["description"],
            price: list[i]["price"],
          )
      );
    }
  }
  final searchedListOfProducts = listOfProducts.where((product) {
    final searchTerm = searchQuery.toLowerCase();
    final prodName = product.productName.toLowerCase();
    return prodName.contains(searchTerm);
  }).toList();

  return searchedListOfProducts;
}