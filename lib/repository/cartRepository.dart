import 'package:amplify_flutter/amplify.dart';
import 'package:shop_app/models/CartModel.dart';

class ProductRepository {
  Future<List<CartModel>> getCartItems() async {
    try{
      final cartItems = await Amplify.DataStore.query(CartModel.classType);
      return cartItems;
    }catch(e){
      throw e;
    }
  }

  Future<String> addToCart(
      {String id,
      String productName,
      String category,
      String company,
      String price,
      int quantity}) async {
    final itemInCart = CartModel(
        idFromAdmin: id,
        productName: productName,
        productCategory: category,
        company: company,
        price: price,
        quantity: quantity);
    try {
      await Amplify.DataStore.save(itemInCart);
      getCartItems();
      return itemInCart.id;
    } catch (e) {
      throw e;
    }
  }

  Future deleteItemFromCart(String originalId) async{
    final itemInCart = CartModel(
      id: originalId,
    );
    try{
      Amplify.DataStore.delete(itemInCart);
    }catch(e){
      print(e.toString());
    }
  }

}
