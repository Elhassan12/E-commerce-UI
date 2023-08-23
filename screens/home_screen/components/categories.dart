import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);

  List<Map<String, dynamic>> categories = [
    {"icon": "assets/icons/Flash Icon.svg", "text": "Flash Deal"},
    {"icon": "assets/icons/Bill Icon.svg", "text": "Bill"},
    {"icon": "assets/icons/Game Icon.svg", "text": "Game"},
    {"icon": "assets/icons/Gift Icon.svg", "text": "Daily Gift"},
    {"icon": "assets/icons/Discover.svg", "text": "More"},
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(categories.length
          , (index) => CategoryCard(text: categories[index]["text"], icon:  categories[index]["icon"], onPress: (){})),
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard({Key? key, required this.text, required this.icon, required this.onPress}) : super(key: key);
  final String text;
  final String icon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              width: getProportionateScreenWidth(55),
              height: getProportionateScreenHeight(55),
              decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(getProportionateScreenHeight(10))
              ),
              child: Center(child: SvgPicture.asset(icon),),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(text,textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}