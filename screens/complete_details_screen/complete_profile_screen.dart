

import 'package:e_commerce_app_ui/components/custom_app_bar.dart';
import 'package:e_commerce_app_ui/screens/complete_details_screen/components/complete_profile_form.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';

import '../../components/heading_style.dart';



class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({Key? key}) : super(key: key);
  static const String routeName = "complete-profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Sign Up"),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
       width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Complete Profile",
                  style: headingStyle(),
                ),
                Text(
                  "Complete your details or continue\nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: getProportionateScreenHeight(30),),
                CompleteProfileForm(),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Text("By continuing you confirm that you agree\nwith our Terms and Conditions",textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.15
                  ),),

              ],
            ),
          ),
        ),
      ),
    );
  }
}




