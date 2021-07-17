import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/productModel.dart';
import 'package:shop_app/screens/category/components/CategoryDataCard.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/utils/fetchAllData.dart';
import 'package:shop_app/utils/selectedProductData.dart';
import '../../size_config.dart';

class SearchScreen extends StatefulWidget {
  final String searchQuery;
  SearchScreen({this.searchQuery});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: FutureBuilder(
              future: getSearchedProductData(widget.searchQuery),
              builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SpinKitPulse(
                      color: Colors.green,
                    ),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, index) {
                              return InkWell(
                                onTap: () {
                                  final selectedProduct = Provider.of<SelectedProductData>(context,listen: false);
                                  selectedProduct.productName = snapshot.data[index].productName;
                                  selectedProduct.companyName = snapshot.data[index].companyName;
                                  selectedProduct.category = snapshot.data[index].category;
                                  selectedProduct.description = snapshot.data[index].description;
                                  selectedProduct.price = snapshot.data[index].price;
                                  selectedProduct.size = snapshot.data[index].size;
                                  selectedProduct.productId = snapshot.data[index].productId;
                                  Navigator.pushNamed(context, DetailsScreen.routeName);
                                },
                                child: CategoryDataCard(
                                  productName: snapshot.data[index].productName,
                                  productCost: snapshot.data[index].price,
                                  id: snapshot.data[index].productId,
                                ),
                              );}, childCount: snapshot.data.length,),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: itemWidth/itemHeight)),
                    ],
                  );
                } else {
                  return Text("Can't Get Items right now, Try again later ");
                }
              },
            )),
      ),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Search Results",
              style: TextStyle(color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "${widget.searchQuery}",
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
