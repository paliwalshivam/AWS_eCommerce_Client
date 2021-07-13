class ProductModel {
  final String statusCode;
  final List<Object> body;
  ProductModel({this.statusCode,this.body});

  factory ProductModel.fromJson(Map<String , dynamic> parsedJson){
    return ProductModel(
    statusCode: parsedJson["statusCode"].toString(),
    body: parsedJson["body"]
    );
  }
}
