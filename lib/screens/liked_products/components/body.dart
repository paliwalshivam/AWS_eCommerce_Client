import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/LikedProducts.dart';
import 'package:shop_app/repository/likedProductsRepository.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/category/components/CategoryDataCard.dart';
import 'package:shop_app/utils/selectedProductData.dart';
import '../../../size_config.dart';


class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final selectedProductData = Provider.of<SelectedProductData>(context);
    final likedProducts = Provider.of<LikedProductsRepository>(context);
    return Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: FutureBuilder(
          future: likedProducts.getLikedProducts(),
          builder: (context, AsyncSnapshot<List<LikedProducts>> snapshot) {

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
                      selectedProductData.isFav = false;
                      likedProducts.removeFromLikedProducts(snapshot.data[index].id).then((value) {
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
                    child: InkWell(
                      onTap: (){
                        final selectedProduct = Provider.of<SelectedProductData>(context,listen: false);
                        selectedProduct.productName = snapshot.data[index].productName;
                        selectedProduct.companyName = snapshot.data[index].company;
                        selectedProduct.category = snapshot.data[index].productCategory;
                        selectedProduct.description = snapshot.data[index].description;
                        selectedProduct.price = snapshot.data[index].price;
                        selectedProduct.size = snapshot.data[index].size;
                        selectedProduct.productId = snapshot.data[index].idFromAdmin;
                        Navigator.pushNamed(context, DetailsScreen.routeName);
                      },
                      child: CategoryDataCard(
                        productName: snapshot.data[index].productName,
                        productCost: snapshot.data[index].price,
                        id: snapshot.data[index].idFromAdmin,
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Text("Can't Get Items right now, Try again later ");
            }
          },
        ));
  }
}
