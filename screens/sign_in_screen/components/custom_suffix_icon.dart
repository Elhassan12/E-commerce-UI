
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../size_config.dart';

class CustomSuffixIcon extends StatelessWidget {
  CustomSuffixIcon({
    Key? key, required this.suffixIcon,
  }) : super(key: key);
  final String suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
        getProportionateScreenWidth(20),
      ),
      child: SvgPicture.asset(
        suffixIcon,
        height: getProportionateScreenWidth(18),
      ),
    );
  }
}