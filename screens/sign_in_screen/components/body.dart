// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/screens/splash/body.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'custom_suffix_icon.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(10)),
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(10),),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sign in with your email and password \n or continue with social media',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight*0.05,),
                SignForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}








// TextFormField nameTextForm(){
//   return TextFormField(
//     obscureText: false,
//     decoration: InputDecoration(
//         hintText: "enter your name",
//         labelText: "name",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         contentPadding:  EdgeInsets.all(30),
//         floatingLabelStyle: TextStyle(
//           color: Colors.blue,
//         ),
//         floatingLabelAlignment: FloatingLabelAlignment.center,
//         focusedBorder: OutlineInputBorder(
//           gapPadding: 50,
//           borderSide:BorderSide(color: Colors.blue,width: 3,),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide:BorderSide(color: Colors.deepOrange,width: 1,),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         border: OutlineInputBorder(
//           borderSide:BorderSide(color: Colors.green,width: 1,),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderSide:BorderSide(color: Colors.purple,width: 1,),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         enabled: false,
//         suffixIcon: suffixIconWidget(suffixIcon: "assets/icons/Lock.svg")
//     ),
//   );
// }
