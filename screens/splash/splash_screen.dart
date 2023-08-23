import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
 static String routeName = "splash/";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Body();
  }
}


