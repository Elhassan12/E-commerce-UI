// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/menu_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../components/custom_app_bar.dart';
import 'components/body.dart';
import 'components/custom_bottom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const String routeName = "profile/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Profile"),
      body: Body(),
      bottomNavigationBar: BottomNavigationMenu(menuState:MenuState.profile),
    );
  }
}


