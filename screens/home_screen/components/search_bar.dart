import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

Container search_bar() {
  return Container(
    width: SizeConfig.screenWidth*0.6,
    decoration: BoxDecoration(
      color: Constants.kSecondaryColor.withOpacity(0.2),
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    ),
    child: TextField(
      onChanged: (value){
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          hintText: "Search Product",
          contentPadding: EdgeInsets.symmetric(horizontal:  getProportionateScreenWidth(20),vertical: getProportionateScreenHeight(9)),
          prefixIcon: Icon(Icons.search)
      ),
    ),

  );
}