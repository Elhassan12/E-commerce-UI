import 'package:e_commerce_app_ui/screens/forget_password_screen/components/body.dart';
import 'package:e_commerce_app_ui/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  static const String routeName = "/forget-password";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:customAppBar("Forget Password"),
      body: Body(),
    );
  }
}
