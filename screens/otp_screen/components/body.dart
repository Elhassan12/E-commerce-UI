// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/screens/otp_screen/components/otp_form.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String phone = args["phone"];
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenHeight(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "OTP Verification",
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(30),
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text("We sent your code to +2 ${phone.substring(0, 3)} ${phone.substring(3, 6)} *****"),
              buildTimer(), // or can use flutter_timer_countdown
              OTPForm(),

            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "this code will expire in  ",
                  textAlign: TextAlign.center,
                ),
                TweenAnimationBuilder(
                  tween: Tween(begin: 30.0, end: 0.0),
                  duration: Duration(seconds: 30),
                  builder: (_, dynamic value, child) => Text(
                    "00:${value.toInt()}",
                    style: TextStyle(color: Constants.kPrimaryColor),
                  ),
                ),
              ],
            );
  }
}
