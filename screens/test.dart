import 'package:e_commerce_app_ui/models/product.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class Test extends StatelessWidget {
  const Test({Key? key, required this.product}) : super(key: key);
 final Product product ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(63),left: getProportionateScreenWidth(20)),
          child: Text(
            product.description,
            maxLines: 3,
            overflow: TextOverflow.visible,
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(3),
        ),
        GestureDetector(
          onTap: (){

          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: getProportionateScreenWidth(20)),
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
                  Icons.arrow_forward_ios_rounded,
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

class AspectRatioTest extends StatelessWidget {
  const AspectRatioTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: SizedBox(
              width: 88,
              child: AspectRatio(
                aspectRatio: 1.5,
                child: Center(
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

