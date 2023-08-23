import 'package:flutter/material.dart';

import '../size_config.dart';

AppBar customAppBar(String title, {int color = 0XFF8B8B8B}) {
  return AppBar(
    title: Center(
      child: Text(
        title,
        style: TextStyle(
          color: Color(color),
          // fontSize: getProportionateScreenWidth(18),
          fontSize: 18,
        ),
      ),
    ),
    // leadingWidth: getProportionateScreenWidth(18),
    leadingWidth:18,
  );
}
