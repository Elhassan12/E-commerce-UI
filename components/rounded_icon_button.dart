import 'package:flutter/material.dart';

import '../size_config.dart';

class RoundedIconButton extends StatelessWidget {
  RoundedIconButton({
    Key? key, required this.iconData,  this.radius =25, required this.onPress,  this.color = Colors.black,
  }) : super(key: key);
  final IconData iconData;
  final double radius;
  final Function() onPress;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Center(
        child: SizedBox(
          child: CircleAvatar(
            radius: getProportionateScreenHeight(radius),
            backgroundColor: Colors.white,
            child: IconButton(onPressed: onPress,icon: Icon(iconData),color: color,),),
        ),
      ),
    );
  }
}