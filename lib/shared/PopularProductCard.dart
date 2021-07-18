import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PopularProductCard extends StatefulWidget {
  final String productName;
  final String productDescription;
  final String productCost;
  final String imageUrl;

  PopularProductCard(
      {this.productName,
      this.productDescription,
      this.productCost,
      this.imageUrl});

  @override
  _PopularProductCardState createState() => _PopularProductCardState();
}

class _PopularProductCardState extends State<PopularProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width*(5/12),
              decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 2, 15, 0),
            child: Column(
              children: [
                Align(
                  child: Text(
                    "${widget.productName}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                  alignment: Alignment.topLeft,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("₹ ${widget.productCost}",style: TextStyle(
                      color: Colors.redAccent,fontSize: 20
                    ),),
                    // IconButton(
                    //     icon: Icon(FontAwesomeIcons.heart,size: 15,),
                    //     onPressed: (){
                    //
                    //   // Favorite Item
                    //
                    // })
                  ],
                ),
                SizedBox(height: 5,),
                Align(
                  child: Text(
                    widget.productDescription.length >=20 ?
                    "${widget.productDescription.substring(0,20)}" : "${widget.productDescription}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 12,
                    ),
                  ),
                  alignment: Alignment.topLeft,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
