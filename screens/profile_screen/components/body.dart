// ignore_for_file: prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfilePic(),
          SizedBox(
            height: 20,
          ),
          ProfileMenu(icon: "assets/icons/User Icon.svg",title: "My Account" ,onPress: () {},),
          ProfileMenu(icon: "assets/icons/Bell.svg",title: "Notifications" ,onPress: () {},),
          ProfileMenu(icon: "assets/icons/Settings.svg",title: "Settings" ,onPress: () {},),
          ProfileMenu(icon: "assets/icons/Question mark.svg",title: "Help Center" ,onPress: () {},),
          ProfileMenu(icon: "assets/icons/Log out.svg",title: "Log Out" ,onPress: () {},),
        ],
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
  }) : super(key: key);
  final String title;
  final String icon;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextButton(
        onPressed: onPress,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              color: Colors.red.withOpacity(0.6),
            ),
            SizedBox(width: 14),
            Text(
             title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            )
          ],
        ),
        style: TextButton.styleFrom(
            padding: EdgeInsets.all(20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: Constants.containerColor),
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            child: Image.asset("assets/images/Profile Image.png"),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: SizedBox(
              width: 46,
              height: 46,
              child: TextButton(
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.white),
                    ),
                    backgroundColor: Constants.containerColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
