import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/repository/likedProductsRepository.dart';
import 'package:shop_app/utils/selectedProductData.dart';
import '../../../size_config.dart';

class ProductDescription extends StatefulWidget {
  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  String toDeleteId = "";
  
  @override
  Widget build(BuildContext context) {
    final selectedProduct = Provider.of<SelectedProductData>(context);
    final likedProduct = Provider.of<LikedProductsRepository>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Text(
                  selectedProduct.productName,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () async {
                    if (selectedProduct.isFav == false) {
                      selectedProduct.isFav = true;
                      //Add to LikedProducts Table
                          final confirmation =  await likedProduct.addToLikedProducts(
                            selectedProduct.productID,
                            selectedProduct.productName,
                            selectedProduct.category,
                            selectedProduct.description,
                            selectedProduct.price,
                            );
                          setState(() {
                            toDeleteId = confirmation;
                          });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Added to Liked Products")));
                    } else if (selectedProduct.isFav == true) {
                      selectedProduct.isFav = false;
                      //Remove from Liked Product Table
                      likedProduct.removeFromLikedProducts(toDeleteId);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Removed from Liked Products")));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    width: getProportionateScreenWidth(64),
                    decoration: BoxDecoration(
                      color: selectedProduct.isFav
                          ? Color(0xFFFFE6E6)
                          : Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color:  selectedProduct.isFav ? Color(0xFFFF4848) : Color(0xFFDBDEE4),
                      height: getProportionateScreenWidth(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Text(
              "₹ ${selectedProduct.price}",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Text(
              selectedProduct.category,
              style: TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
              right: getProportionateScreenWidth(64),
            ),
            child: Text(
              selectedProduct.description,
            ),
          ),
        ],
      ),
    );
  }
}
