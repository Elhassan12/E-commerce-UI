import 'package:e_commerce_app_ui/models/product.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/body.dart';

import '../../components/rounded_icon_button.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static const routeName = "/details";

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(
          rating: product.rating,
        ),
      ),
      body: Body(product: product),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final double rating;

  CustomAppBar({required this.rating});

  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: SizedBox(
              child: RoundedIconButton(
                iconData: Icons.arrow_back_ios_rounded,
                onPress: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Spacer(),
          Container(
            margin: EdgeInsets.only(right: getProportionateScreenWidth(15)),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(14),
                vertical: getProportionateScreenHeight(5)),
            decoration: BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Text(
                  "$rating",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(5),
                ),
                SvgPicture.asset("assets/icons/Star Icon.svg")
              ],
            ),
          ),
          SizedBox(
            width: getProportionateScreenHeight(20),
          )
        ],
      ),
    );
  }
}

