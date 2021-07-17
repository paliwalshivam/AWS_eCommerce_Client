import 'package:amplify_flutter/amplify.dart';
import 'package:shop_app/models/ModelProvider.dart';

class OrderedProductsRepository {
  Future<String> orderProduct(String productName, int quantity,String customerName,
      String mobileNumber, String address,String orderTotal,String idFromAdmin) async {
    final orderedProduct = OrderList(
      productName: productName,
      quantity: quantity,
      customerName: customerName,
      mobileNumber: mobileNumber,
      address: address,
      orderTotal: orderTotal,
      idFromAdmin: idFromAdmin
    );
    try{
      await Amplify.DataStore.save(orderedProduct);
      return "Success";
    }catch (e){
      throw e;
    }
  }
}
