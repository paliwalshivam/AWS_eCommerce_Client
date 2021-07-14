import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/body.dart';
import 'package:shop_app/utils/selectedCategoryToShow.dart';



class CategoryScreen extends StatelessWidget {
  static String routeName = "/category";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    final selectedCategoryToShow = Provider.of<SelectedCategoryToShow>(context,listen: false);
    return AppBar(
      title: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${selectedCategoryToShow.selectedCategory}",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
