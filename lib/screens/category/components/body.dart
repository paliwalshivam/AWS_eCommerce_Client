import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/productModel.dart';
import 'package:shop_app/utils/fetchCategoryData.dart';
import 'package:shop_app/screens/category/components/CategoryDataCard.dart';
import '../../../size_config.dart';
import 'package:shop_app/utils/selectedCategoryToShow.dart';


class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final selectedCategoryToShow = Provider.of<SelectedCategoryToShow>(context,listen: false);
    return Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: FutureBuilder(
          future: getCategoryProductData(selectedCategoryToShow.selectedCategory),
          builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
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
                  child: CategoryDataCard(
                    productName: snapshot.data[index].productName,
                    productCost: snapshot.data[index].price,
                    id: snapshot.data[index].productId,
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
