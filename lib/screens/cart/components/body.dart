import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../size_config.dart';
import 'cart_card.dart';
import 'package:shop_app/repository/cartRepository.dart';
import 'package:shop_app/models/CartModel.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final productRepository = Provider.of<ProductRepository>(context);
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: FutureBuilder(
          future: productRepository.getCartItems(),
          builder: (context, AsyncSnapshot<List<CartModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SpinKitPulse(
                  color: Colors.green,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: Key("Remove"),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      // Delete Item Code
                      productRepository.deleteItemFromCart(snapshot.data[index].id).then((value) {
                        setState(() {

                        });
                      });
                    },
                    background: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFE6E6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Spacer(),
                          SvgPicture.asset("assets/icons/Trash.svg"),
                        ],
                      ),
                    ),
                    child: CartCard(
                      productName: snapshot.data[index].productName,
                      productCost: snapshot.data[index].price,
                      idFromParent: snapshot.data[index].idFromAdmin,
                      quantity: snapshot.data[index].quantity,
                    ),
                  ),
                ),
              );
            } else {
              return Text("Can't Get Items in Cart, Try Again Later");
            }
          },
        ));
  }
}
