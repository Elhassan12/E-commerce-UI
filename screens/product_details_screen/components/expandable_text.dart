// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textSize = SizeConfig.screenHeight / 4.63;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.text.length > textSize) {
      firstHalf = widget.text.substring(0, textSize.toInt());
      secondHalf = widget.text.substring(textSize.toInt(), widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
      hiddenText = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(secondHalf.isEmpty);
    return secondHalf.isEmpty
        ? Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(63),left: getProportionateScreenWidth(20)),
          child: Text(
              firstHalf,
            ),
        )
        : Column(
            children: [
              hiddenText
                  ? Padding(
                      padding: EdgeInsets.only(right: getProportionateScreenWidth(63),left: getProportionateScreenWidth(20)),
                    child: Text(
                        firstHalf +"...",
                        maxLines: 3,
                        overflow: TextOverflow.visible,
                      ),
                  )
                  : Padding(
                padding: EdgeInsets.only(right: getProportionateScreenWidth(63),left: getProportionateScreenWidth(20)),
                    child: Text(firstHalf + secondHalf),
                  ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    hiddenText = !hiddenText;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: getProportionateScreenWidth(20)),
                  child: Row(
                    children: [
                      Text(
                        "see more Details",
                        style: TextStyle(
                          color: Constants.kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(0)),
                      Icon(
                       hiddenText?Icons.arrow_forward_ios_rounded:Icons.arrow_back_ios_rounded,
                        color: Constants.kPrimaryColor,
                        size: getProportionateScreenWidth(12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
  }
}
