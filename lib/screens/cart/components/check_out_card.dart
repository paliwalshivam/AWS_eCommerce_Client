import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/models/CartModel.dart';
import 'package:shop_app/repository/cartRepository.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import '../../../size_config.dart';

class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  Future<double> calculateTotal() async {
    final productRepository = Provider.of<ProductRepository>(context);
    double cost = 0;
    final List<CartModel> allItems = await productRepository.getCartItems();
    allItems.forEach((item) {
      cost = cost + double.parse(item.price) * item.quantity;
    });
    print(cost);
    return cost;
  }

  @override
  Widget build(BuildContext context) {
    final productRepository = Provider.of<ProductRepository>(context);
    return FutureBuilder(
      future: calculateTotal(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(15),
              horizontal: getProportionateScreenWidth(30),
            ),
            // height: 174,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -15),
                  blurRadius: 20,
                  color: Color(0xFFDADADA).withOpacity(0.15),
                )
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Total:\n",
                          children: [
                            TextSpan(
                              text: "₹ ${snapshot.data}",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(190),
                        child: DefaultButton(
                          text: "Check Out",
                          press: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Place Order"),
                                    actions: [
                                      Row(
                                        children: [
                                          TextButton(
                                              onPressed: () async{
                                                //Save Order and Sync to Admin Code
                                                final listToPass = await productRepository.getCartItems();
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=> CompleteProfileScreen(listToPass)));
                                              },
                                              child: Text("Yes")),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("No"))
                                        ],
                                      )
                                    ],
                                  );
                                });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else {
          return Text("");
        }
      },
    );
  }
}
