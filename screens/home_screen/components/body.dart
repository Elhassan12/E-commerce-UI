// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:e_commerce_app_ui/screens/home_screen/components/popular_product.dart';
import 'package:e_commerce_app_ui/screens/home_screen/components/search_bar.dart';
import 'package:e_commerce_app_ui/screens/home_screen/components/section_title.dart';
import 'package:e_commerce_app_ui/screens/home_screen/components/special_offer.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import '../../cart_screen/cart_screen.dart';
import 'categories.dart';
import 'discount_banner.dart';
import 'icon_button_with_counter.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(22),
              ),
              home_header(context),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              discount_banner(),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Categories(),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              special_offer(),
              popularSection(),
              SizedBox(height: 10,),],
          ),
        ),
      ),
    );
  }

  Row home_header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        search_bar(),
        icon_button_with_counter(
            svgPicture: "assets/icons/Cart Icon.svg",
            counter: 1,
            onPress: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            }),
        icon_button_with_counter(
            svgPicture: "assets/icons/Bell.svg", counter: 3, onPress: () {}),
      ],
    );
  }
}

class special_offer extends StatelessWidget {
  const special_offer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        section_title(
          onPress: () {},
          title: "Special for you",
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            children: [
              SpecialOfferCard(
                  image: "assets/images/Image Banner 2.png",
                  onPress: () {},
                  category: "Smartphones",
                  numOfBrands: 18),
              SpecialOfferCard(
                  image: "assets/images/Image Banner 3.png",
                  onPress: () {},
                  category: "Fashion",
                  numOfBrands: 26),
              SizedBox(
                width: getProportionateScreenWidth(10),
              )
            ],
          ),
        ),
      ],
    );
  }
}
