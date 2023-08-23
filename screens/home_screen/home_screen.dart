import 'package:e_commerce_app_ui/menu_state_enum.dart';
import 'package:e_commerce_app_ui/screens/profile_screen/components/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      bottomNavigationBar: BottomNavigationMenu(menuState: MenuState.home),
    );
  }
}
