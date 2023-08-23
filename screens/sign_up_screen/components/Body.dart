// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:e_commerce_app_ui/screens/sign_up_screen/components/sign_up_form.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import '../../../components/heading_style.dart';
import '../../../components/no_account_text.dart';
import '../../../components/social_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(20)),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Register Account",
                  style: headingStyle(),
                ),
                Text(
                  "Complete your details or continue\nwith social media",
                  textAlign: TextAlign.center,
                ),
                SignUpForm(),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(image: "assets/icons/google-icon.svg",onPress: (){},),
                    SocialCard(image: "assets/icons/facebook-2.svg",onPress: (){},),
                    SocialCard(image: "assets/icons/twitter.svg",onPress: (){},),
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Text("By continuing you confirm that you agree\nwith our Terms and Conditions",textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.15
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
