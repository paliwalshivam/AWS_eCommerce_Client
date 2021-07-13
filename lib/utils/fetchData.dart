import 'dart:convert';
import 'package:http/http.dart' as http;

void getProductData() async {

  // List list ;
  // var response = await http.get(Uri.parse('https://ym1sv9rs28.execute-api.us-east-1.amazonaws.com/production/products'));
  // Map<String,dynamic> map  = json.decode(response.body);
  // list = map["body"];


  List<Map<String,dynamic>> list;
  final response = await http.get(Uri.parse('https://ym1sv9rs28.execute-api.us-east-1.amazonaws.com/production/products'));
  Map<String,dynamic> map  = json.decode(response.body);
  final body = map['body'];

  if(body is List){
    list = List.from(map["body"] as List<Map<String,dynamic>>);
  }else {
    print('Body is\'nt List');
  }

}