// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import '../../../components/no_account_text.dart';
import 'forget_password_form.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(10)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                "Forget Password",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(7),
              ),
              const Text(
                'please enter your email and we will send\n you a link to return your account',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(80),
              ),
              ForgetPasswordForm(),
              SizedBox(
                height: getProportionateScreenHeight(140),
              ),
              NoAccountText(),
            ],
          ),
        ),
      ),
    ));
  }
}




