import 'package:e_commerce_app_ui/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'components/Body.dart';

class SignUPScreen extends StatelessWidget {
  const SignUPScreen({Key? key}) : super(key: key);
  
  static const routeName = "sign-up/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Sign UP"),
      body: Body(),
    );
  }
}
