import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/category/category_screen.dart';
import '../../../size_config.dart';
import 'package:shop_app/utils/selectedCategoryToShow.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/pot.svg", "text": "Herbs"},
      {"icon": "assets/icons/Bill Icon.svg", "text": "Shrubs"},
      {"icon": "assets/icons/Game Icon.svg", "text": "Climbers"},
      {"icon": "assets/icons/Gift Icon.svg", "text": "Trees"},
      {"icon": "assets/icons/Discover.svg", "text": "Pots"},
    ];

    List<String> categoriesName = [
      "Herbs","Shrubs","Climbers","Trees","Pots"
    ];
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {
              final selectedCategoryToShow = Provider.of<SelectedCategoryToShow>(context,listen: false);
              selectedCategoryToShow.selectedCategory = categoriesName[index];
              print(categoriesName[index]);
              Navigator.pushNamed(context, CategoryScreen.routeName);
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
