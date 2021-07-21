import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/shared/PopularProductCard.dart';
import 'package:shop_app/utils/fetchAllData.dart';
import 'package:shop_app/utils/selectedProductData.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';

class Body extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    final selectedProduct = Provider.of<SelectedProductData>(context);
    return SafeArea(
      child: Container(
          child: FutureBuilder(
            future: getProductData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                        delegate: SliverChildListDelegate([
                          SizedBox(height: getProportionateScreenHeight(20)),
                          HomeHeader(),
                          SizedBox(height: getProportionateScreenWidth(10)),
                          DiscountBanner(),
                          Categories(),
                          SizedBox(height: getProportionateScreenWidth(30)),
                        ])),
                    SliverList(
                        delegate: SliverChildListDelegate([
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(20)),
                            child:
                            SectionTitle(title: "Popular Products", press: () async {
                              try{
                                print("Working");
                                var res = await Amplify.Auth.fetchUserAttributes();
                                res.forEach((element) {
                                  print('key: ${element.userAttributeKey}; value: ${element.value}');
                                });
                              }on AuthException catch (e){
                                print(e.message);
                              }
                            }),
                          ),
                          SizedBox(height: getProportionateScreenWidth(30)),
                        ])),
                    SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                                (BuildContext context, index) {
                                  final productModel = snapshot.data[index];
                                  return InkWell(
                                    onTap: () {
                                      selectedProduct.productName = productModel.productName;
                                      selectedProduct.category = productModel.category;
                                      selectedProduct.description = productModel.description;
                                      selectedProduct.price = productModel.price;
                                      selectedProduct.productId = productModel.productId;
                                      Navigator.pushNamed(context, DetailsScreen.routeName);
                                      },
                                    child: PopularProductCard(
                                      productName: productModel.productName,
                                      productDescription: productModel.description,
                                      productCost: productModel.price,
                                      imageUrl: "https://productslist231449-dev.s3.us-east-1.amazonaws.com/public/" + productModel.productId + "img1",
                                    ),
                                  );}, childCount: snapshot.data.length,),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10,crossAxisSpacing: 5,childAspectRatio: itemWidth/itemHeight)),

                  ],
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SpinKitPulse(
                    color: Colors.green,
                  ),
                );
              } else {
                return Center(
                  child: Text("Can't get Products "),
                );
              }
              },
          )),
    );
  }
}
