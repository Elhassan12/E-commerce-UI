import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';
import '../models/product.dart';
import '../screens/product_details_screen/details_screen.dart';
import '../size_config.dart';

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.product,
    this.width = 140,
  }) : super(key: key);
  final Product product;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, DetailsScreen.routeName,arguments: product);
      },
      child: Column(
        children: [
          SizedBox(
            width: getProportionateScreenHeight(width),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.02,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenHeight(20)),
                    decoration: BoxDecoration(
                      color: Constants.kSecondaryColor.withOpacity(0.1),
                      borderRadius:
                      BorderRadius.circular(getProportionateScreenWidth(15)),
                    ),
                    child: Image.asset("${product.images[0]}"),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                Text(
                  "${product.title}",
                  style: TextStyle(color: Colors.black),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${product.price}",
                      style: TextStyle(
                          color: Constants.kPrimaryColor,
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: (){},
                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(9)),
                        height: getProportionateScreenWidth(30),
                        width: getProportionateScreenWidth(30),
                        decoration: BoxDecoration(
                          color: product.isFavourite
                              ? Constants.kPrimaryColor.withOpacity(0.15)
                              : Constants.kSecondaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Heart Icon_2.svg",
                          color: product.isFavourite
                              ? Color(0xFFFF4848)
                              : Color(0xFFDBDEE4),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}