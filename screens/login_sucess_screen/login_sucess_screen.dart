
import 'package:flutter/material.dart';
import '../../components/custom_app_bar.dart';
import 'components/body.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({Key? key}) : super(key: key);
  static const routeName = "login-success/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Login Success"),
      body: Body(),
    );
  }
}
