import 'package:flutter/material.dart';

import '../../../size_config.dart';

Container discount_banner() {
  return Container(
    padding: EdgeInsets.all(getProportionateScreenHeight(15)),
    width: double.infinity,
    decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(getProportionateScreenWidth(20))
    ),
    child: Text.rich(
      TextSpan(
          style: TextStyle(color:Colors.white),
          children: [
            TextSpan( text:" A summer surprise\n"),
            TextSpan(text: "Cashback 20%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: getProportionateScreenWidth(24))),
          ]
      ),),
  );
}