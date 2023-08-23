import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/models/cart.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: demoCarts.length,
      itemBuilder: ((context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(10),
              horizontal: getProportionateScreenWidth(20)),
          child: Dismissible(
            key: Key(demoCarts[index].product.id.toString()),
            child: CartItemCard(index: index),
            direction:DismissDirection.endToStart,
            background: Container(
              color: Colors.red.withOpacity(0.1),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                  SizedBox(width: getProportionateScreenWidth(20),)
                ],
              ),
            ),
            onDismissed: (direction){
              setState(() {
                demoCarts.removeAt(index);
              });
            },
          ),
        );
      }),
    );
  }
}

class CartItemCard extends StatelessWidget {
  CartItemCard({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(88),
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(5)),
              decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenHeight(15))),
              child: Image.asset("${demoCarts[index].product.images[0]}"),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${demoCarts[index].product.title}"),
            SizedBox(
              height: getProportionateScreenHeight(13),
            ),
            Row(
              children: [
                Text(
                  "\$${demoCarts[index].product.price}",
                  style: TextStyle(color: Constants.kPrimaryColor),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(5),
                ),
                Text("x${demoCarts[index].numOfItem}")
              ],
            ),
          ],
        ),
      ],
    );
  }
}
