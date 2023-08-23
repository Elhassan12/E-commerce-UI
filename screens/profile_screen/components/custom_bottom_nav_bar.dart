import 'package:e_commerce_app_ui/provider/home_page.dart';
import 'package:e_commerce_app_ui/screens/home_screen/home_screen.dart';
import 'package:e_commerce_app_ui/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../menu_state_enum.dart';

class BottomNavigationMenu extends StatelessWidget {
  BottomNavigationMenu({
    Key? key, required this.menuState,
  }) : super(key: key);
  final MenuState menuState;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: (){
              Navigator.pushNamed(context, HomeScreen.routeName);
            }, icon: SvgPicture.asset("assets/icons/Shop Icon.svg",color:MenuState.home == menuState?Constants.kPrimaryColor:Colors.black26,)),
            IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/Heart Icon.svg",color:MenuState.favourite == menuState?Constants.kPrimaryColor:Colors.black26),),
            IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg",color:MenuState.message == menuState?Constants.kPrimaryColor:Colors.black26),),
            IconButton(onPressed: (){
              Navigator.pushNamed(context, ProfileScreen.routeName);
            }, icon: SvgPicture.asset("assets/icons/User.svg",color: MenuState.profile == menuState?Constants.kPrimaryColor:Colors.black26,),),
          ],
        ),
      ),
    );
  }
}