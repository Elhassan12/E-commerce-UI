import 'package:e_commerce_app_ui/screens/home_screen/home_screen.dart';
import 'package:e_commerce_app_ui/screens/sign_in_screen/sign_in_screen.dart';
import 'package:e_commerce_app_ui/screens/splash/body.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/default_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Container(
              height: getProportionateScreenHeight(330),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(
                "assets/images/success.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(55),),
                  Text(
                    "Login Success",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(30),
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(110),
                  ),
                  DefaultButton(
                    text: "Back to home",
                    onPressed: () {
                      Navigator.pushNamed(context,HomeScreen.routeName);
                    },
                    width: getProportionateScreenWidth(200),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
