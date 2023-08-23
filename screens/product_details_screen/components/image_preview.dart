import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/product.dart';
import '../../../size_config.dart';

class ImagesPreview extends StatefulWidget {
  ImagesPreview({Key? key, required this.product}) : super(key: key);
  final Product product;

  @override
  State<ImagesPreview> createState() => _ImagesPreviewState();
}

class _ImagesPreviewState extends State<ImagesPreview> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: getProportionateScreenWidth(238),
            child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(widget.product.images[selectedImage])),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product.images.length,
                    (index) => buildSmallPreview(index)),
          ],
        ),
      ],
    );
  }


  GestureDetector buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.all(getProportionateScreenHeight(10)),
        padding: EdgeInsets.all(getProportionateScreenHeight(5)),
        width: getProportionateScreenWidth(48),
        height: getProportionateScreenHeight(48),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: index == selectedImage
                    ? Constants.kPrimaryColor
                    : Colors.transparent)),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}