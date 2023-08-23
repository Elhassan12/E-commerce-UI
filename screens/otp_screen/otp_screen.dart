import 'package:e_commerce_app_ui/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../otp_screen/components/body.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);
  static const routeName = "/otp-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("OTP Verification"),
      body:Body(),
    );
  }
}
