import 'package:e_commerce_app_ui/screens/sign_in_screen/components/body.dart';
import 'package:flutter/material.dart';

import '../../components/custom_app_bar.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);
static String routeName = "sign-in/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Sign In"),
      body: Body(),
    );
  }
}



