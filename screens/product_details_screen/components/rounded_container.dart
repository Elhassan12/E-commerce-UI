import 'package:flutter/material.dart';

import '../../../size_config.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(getProportionateScreenWidth(35)),
            topRight: Radius.circular(getProportionateScreenWidth(35)),
          )),
      child: child,
    );
  }
}