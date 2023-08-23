import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/screens/sign_in_screen/sign_in_screen.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';

import '../../components/default_button.dart';
import 'content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "We help people connect with store \naround United States of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) {
                      return SplashContent(
                          text: splashData[index]["text"] ?? " ",
                          title: "Tokoto",
                          image: splashData[index]["image"] ?? " ");
                    })),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenHeight(20)),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(currentPage, index),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    DefaultButton(
                        text: "Continue",
                        onPressed: () {
                          Navigator.pushNamed(context, SignInScreen.routeName);
                        }),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}






AnimatedContainer buildDot(currentPage, index) {
  return AnimatedContainer(
    duration: Constants.kAnimationDuration,
    margin: EdgeInsets.only(right: 5),
    width: currentPage == index ? 20 : 6,
    height: 6,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(3),
      color: currentPage == index ? Constants.kPrimaryColor : Color(0xFFD8D8D8),
    ),
  );
}
