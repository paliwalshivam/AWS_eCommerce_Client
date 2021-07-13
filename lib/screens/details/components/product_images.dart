import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/utils/selectedProductData.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    final selectedProduct = Provider.of<SelectedProductData>(context);
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.network("https://productslist231449-dev.s3.us-east-1.amazonaws.com/public/"+selectedProduct.productID+"img1"),
          ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(3,
                (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    final selectedProduct = Provider.of<SelectedProductData>(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image.network("https://productslist231449-dev.s3.us-east-1.amazonaws.com/public/"+selectedProduct.productID+"img"+(index+1).toString()),
      ),
    );
  }
}
