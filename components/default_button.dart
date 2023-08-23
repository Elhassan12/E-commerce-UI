import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
  }) : super(key: key);
  final String text;
  final Function onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width??double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        onPressed: onPressed as void Function(),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(18),
          ),
        ),
        style: TextButton.styleFrom(
            backgroundColor: Constants.kPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(getProportionateScreenWidth(20)))),
      ),
    );
  }
}