import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class FormError extends StatelessWidget {
  FormError({Key? key, required this.errors}) : super(key: key);
  List<String> errors;

  @override
  Widget build(BuildContext context) {
    print("errors length ${errors.length} in form error");
    return Column(
      children:
      List.generate(errors.length, (index) => formErrorText(errors[index])),
    );
  }

  Row formErrorText(String error) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          width: getProportionateScreenWidth(15),
          height: getProportionateScreenHeight(15),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}