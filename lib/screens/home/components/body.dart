import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/utils/fetchData.dart';

import '../../../size_config.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenWidth(10)),
            InkWell(
              onTap: () async{
                Map<String,dynamic> map = {
                  "statusCode" : 200,
                  "body" : [
                    {
                      "product" : "clear",
                      "company" : "new"
                    },
                    {
                      "product" : "clear2",
                      "company" : "new2"
                    }
                  ]
                };
                print(map);
                getProductData();

              },
                child: DiscountBanner()),
            Categories(),
            SizedBox(height: getProportionateScreenWidth(30)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],
        ),
      ),
    );
  }
}
