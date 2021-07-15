import 'package:flutter/material.dart';
import 'components/body.dart';
import 'package:shop_app/screens/liked_products/components/body.dart';

class LikedProductsScreen extends StatelessWidget {
  static String routeName = "/likedProducts";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Liked Products",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Swipe left to remove Items",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
