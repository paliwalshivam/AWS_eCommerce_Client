import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/size_config.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int quantity =0 ;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Quantity",style: TextStyle(color: Colors.black,fontSize: 20),),

                          Row(
                            children: [
                              IconButton(icon: Icon(FontAwesomeIcons.plusCircle), onPressed: (){
                                setState(() {
                                  quantity++;
                                });
                              }),
                              Text(quantity.toString(),style: TextStyle(color: Colors.black,fontSize: 20),),
                              IconButton(icon: Icon(FontAwesomeIcons.minusCircle), onPressed: (){
                                setState(() {
                                  quantity == 0 ? quantity =0 : quantity = quantity-1;
                                });
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {
                            Navigator.pushNamed(context, CartScreen.routeName);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
