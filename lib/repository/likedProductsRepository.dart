import 'package:amplify_flutter/amplify.dart';
import 'package:shop_app/models/LikedProducts.dart';

class LikedProductsRepository {


  Future<List<LikedProducts>> getLikedProducts() async {
    try{
      final likedProducts = await Amplify.DataStore.query(LikedProducts.classType);
      return likedProducts;
    }catch(e){
      throw e;
    }
  }

  Future<String> addToLikedProducts(
      String idFromAdmin,
      String productName,
      String productCategory,
      String description,
      String price,
      ) async {
    final likedProduct = LikedProducts(
        idFromAdmin: idFromAdmin,
        productName: productName,
        productCategory: productCategory,
        description: description,
        price: price,
    );
    try {
     Amplify.DataStore.save(likedProduct);
     getLikedProducts();
     return likedProduct.id;
    } catch (e) {
      throw e;
    }
  }


  Future<void> removeFromLikedProducts(String idOriginal) async {
    final toRemoveProduct = LikedProducts(
      id: idOriginal
    );
    try{
      Amplify.DataStore.delete(toRemoveProduct);
    }catch (e){
      throw e;
    }
  }
}
