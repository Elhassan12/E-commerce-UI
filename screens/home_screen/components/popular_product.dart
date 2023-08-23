import 'package:e_commerce_app_ui/screens/home_screen/components/section_title.dart';
import 'package:flutter/material.dart';

import '../../../components/product_card.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';

class popularSection extends StatelessWidget {
  const popularSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        section_title(
          onPress: () {},
          title: "Popular Products",
        ),
        SizedBox(
          height: getProportionateScreenHeight(12),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                demoProducts.length,
                    (index) => Padding(
                  padding:
                  EdgeInsets.only(left: getProportionateScreenWidth(10)),
                  child: ProductCard(product: demoProducts[index]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}