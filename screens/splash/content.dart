import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class SplashContent extends StatelessWidget {
  SplashContent(
      {Key? key, required this.text, required this.title, required this.image})
      : super(key: key);
  final String text;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          title,
          style: TextStyle(
              color: Constants.kPrimaryColor,
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          width: getProportionateScreenWidth(235),
          height: getProportionateScreenHeight(265),
        ),
      ],
    );
  }
}
