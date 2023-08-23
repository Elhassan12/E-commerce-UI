// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:e_commerce_app_ui/components/default_button.dart';
import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/models/cart.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'components/body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String routeName = "cart/";

  double totalPrice() {
    double total = 0;
    for (var product in demoCarts) {
      total += (product.product.price * product.numOfItem);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: getProportionateScreenHeight(16),
        title: Center(
          child: Column(
            children: [
              Text(
                "Your Cart",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "${Constants.cartItems} items",
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ),
      body: Body(),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(getProportionateScreenHeight(30)),
        // height: getProportionateScreenHeight(200),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -15),
                color: Colors.black.withOpacity(0.1),
                blurRadius: getProportionateScreenWidth(30),
              ),
            ],
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(getProportionateScreenHeight(30)))),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(getProportionateScreenHeight(10)),
                    width: getProportionateScreenWidth(40),
                    height: getProportionateScreenHeight(40),
                    decoration: BoxDecoration(
                        color: Constants.containerColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset("assets/icons/receipt.svg"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  Text("Add voucher code"),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Constants.kTextColor,
                    size: getProportionateScreenHeight(12),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(30),),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Total:"),
                      Text("\$${totalPrice().ceilToDouble()}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
                    ],
                  ),
                  Spacer(),
                  DefaultButton(text: "Check Out", onPressed: (){},width: 180,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
