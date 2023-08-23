import 'package:flutter/material.dart';

import '../../../size_config.dart';

class section_title extends StatelessWidget {
   section_title({
    Key? key, required this.title, required this.onPress,
  }) : super(key: key);
   final String title;
   final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              color: Colors.black),
        ),
        GestureDetector(
          onTap: onPress,
          child: Text(
            "see more",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ),
        ),
      ],
    );
  }
}