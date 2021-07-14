import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/productModel.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/shared/PopularProductCard.dart';
import 'package:shop_app/utils/fetchAllData.dart';
import 'package:shop_app/utils/selectedProductData.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedProduct = Provider.of<SelectedProductData>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FutureBuilder(
                future: getProductData(),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Center(
                        child: SpinKitPulse(
                          color: Colors.green,
                        ),
                      ),
                    );
                  }
                  else if(snapshot.connectionState == ConnectionState.done){
                    return SizedBox(
                      height: 400,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                          itemBuilder: (context,index){
                          ProductModel productModel = snapshot.data[index];
                        return InkWell(
                          onTap: (){
                            selectedProduct.productName = productModel.productName;
                            selectedProduct.companyName = productModel.companyName;
                            selectedProduct.category = productModel.category;
                            selectedProduct.description = productModel.description;
                            selectedProduct.price = productModel.price;
                            selectedProduct.size = productModel.size;
                            selectedProduct.productId = productModel.productId;
                            Navigator.pushNamed(context, DetailsScreen.routeName);
                          },
                          child: PopularProductCard(
                            productName: productModel.productName,
                            productDescription: productModel.description,
                            productCost: productModel.price,
                            imageUrl: "https://productslist231449-dev.s3.us-east-1.amazonaws.com/public/"+productModel.productId+"img1",
                          ),
                        );
                      }),
                    );
                  }
                  else{
                    return Center(
                      child: Text("Can't Load Products at the moment, Try again Later"),
                    );
                  }
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
