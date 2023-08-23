import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

InkWell icon_button_with_counter({required String svgPicture,counter = 0,required Function() onPress}) {
  return InkWell(
    onTap: onPress,
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(100)),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: EdgeInsets.all(getProportionateScreenHeight(9)),
          width: getProportionateScreenWidth(45),
          height: getProportionateScreenHeight(45),
          decoration: BoxDecoration(
            color:  Constants.kSecondaryColor.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(svgPicture),
        ),
        if(counter != 0)
          Positioned(
            right: 0,
            top: -2,
            child: Container(
              width: getProportionateScreenWidth(16),
              height: getProportionateScreenHeight(16),
              decoration: BoxDecoration(
                  color: Color(0xFFFF4848),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white,width: 1.5)
              ),
              child: Center(
                child: Text("$counter",style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(10),
                  height: 1,
                  fontWeight: FontWeight.w600,
                ),),
              ),
            ),
          )
      ],
    ),
  );
}