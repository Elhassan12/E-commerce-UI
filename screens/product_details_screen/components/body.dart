
import 'package:e_commerce_app_ui/components/default_button.dart';
import 'package:e_commerce_app_ui/components/rounded_icon_button.dart';
import 'package:e_commerce_app_ui/models/product.dart';
import 'package:e_commerce_app_ui/screens/product_details_screen/components/product_description.dart';
import 'package:e_commerce_app_ui/screens/product_details_screen/components/rounded_container.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'image_preview.dart';

class Body extends StatelessWidget {
  Body({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          ImagesPreview(product: product),
          RoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  product: product,
                  preesOnSeeMore: () {},
                ),
                SizedBox(height: getProportionateScreenHeight(5),),
                RoundedContainer(color: Color(0xFFF6F7F9), child: Column(
                  children: [
                    ColorDots(product: product,),
                    RoundedContainer(color: Colors.white, child: Padding(
                      padding:  EdgeInsets.only(left: getProportionateScreenWidth(40),top: getProportionateScreenHeight(10),right: getProportionateScreenWidth(40)),
                      child: Column(
                        children: [
                          DefaultButton(text: "Add to Cart", onPressed: (){}),
                          SizedBox(height: getProportionateScreenHeight(40),)
                        ],
                      ),
                    ))
                  ],
                )),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
class ColorDots extends StatefulWidget {
   ColorDots({Key? key, this.product}) : super(key: key);
  final product;

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int isSelected =0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: getProportionateScreenHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...List.generate(widget.product.colors.length, (index) => GestureDetector(onTap:(){
            setState(() {
              isSelected = index;
            });
          },child: ColorDot(product:widget.product,index: index,isSelected: isSelected,))),
          Spacer(),
          RoundedIconButton(iconData:Icons.remove, onPress: (){}),
          SizedBox(width: getProportionateScreenWidth(20),),
          RoundedIconButton(iconData:Icons.add, onPress: (){}),
        ],
      ),
    );
  }
}


class ColorDot extends StatelessWidget {


  const ColorDot({
    Key? key,
    required this.product, required this.index, required this.isSelected,
  }) : super(key: key);
  final Product product;
 final int index;
 final int isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      margin:EdgeInsets.only(right: getProportionateScreenWidth(5)) ,
      width: getProportionateScreenWidth(40),
      height: getProportionateScreenHeight(40),
      decoration: BoxDecoration(
        border: Border.all(color: isSelected == index?Constants.kPrimaryColor:Colors.transparent,),
        shape: BoxShape.circle
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: product.colors[index],
          shape: BoxShape.circle
        ),
      ),
    );
  }
}




