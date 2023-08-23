import 'package:e_commerce_app_ui/screens/product_details_screen/components/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  ProductDescription({
    Key? key,
    required this.product,
    required this.preesOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback preesOnSeeMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10),horizontal: getProportionateScreenWidth(20)),
          child: Text(
            product.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(20)),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: getProportionateScreenWidth(60),
            height: getProportionateScreenHeight(40),
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenHeight(12)),
              decoration: BoxDecoration(
                  color: product.isFavourite
                      ? Constants.kPrimaryColor.withOpacity(0.2)
                      : Color(0xFFDBDEE4),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(getProportionateScreenWidth(20)),
                      bottomLeft:
                      Radius.circular(getProportionateScreenWidth(20)))),
              child: SvgPicture.asset(
                "assets/icons/Heart Icon_2.svg",
                color: product.isFavourite ? Colors.red : Color(0xFFDBDEE4),
              ),
            ),
          ),
        ),
       SingleChildScrollView(
         child: ExpandableText(text: product.description,),
       ),

      ],
    );
  }
}


