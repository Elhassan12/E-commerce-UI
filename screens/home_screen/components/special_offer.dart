import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key, required this.image, required this.onPress, required this.category, required this.numOfBrands,
  }) : super(key: key);
  final String image;
  final Function() onPress;
  final String category;
  final int numOfBrands;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding:  EdgeInsets.only(left: getProportionateScreenWidth(10)),
        child: SizedBox(
          height: getProportionateScreenHeight(100),
          width: getProportionateScreenWidth(220),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                getProportionateScreenWidth(15)),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:
                            getProportionateScreenWidth(18),
                          ),
                        ),
                        TextSpan(
                          text: "$numOfBrands Brand",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}