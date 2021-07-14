import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CategoryDataCard extends StatefulWidget {
  final String productName;
  final String productCost;
  final String id;
  CategoryDataCard({this.productName,this.productCost,this.id});

  @override
  _CategoryDataCardState createState() => _CategoryDataCardState();
}

class _CategoryDataCardState extends State<CategoryDataCard> {
  @override
  Widget build(BuildContext context) {


    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.network("https://productslist231449-dev.s3.us-east-1.amazonaws.com/public/"+widget.id+"img1",fit: BoxFit.cover,),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${widget.productName}",
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "₹ ${widget.productCost}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
              ),
            )
          ],
        )
      ],
    );
  }
}
