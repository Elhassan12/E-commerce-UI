import 'package:e_commerce_app_ui/screens/cart_screen/cart_screen.dart';
import 'package:e_commerce_app_ui/screens/cart_screen/cart_screen.dart';
import 'package:e_commerce_app_ui/screens/complete_details_screen/complete_profile_screen.dart';
import 'package:e_commerce_app_ui/screens/complete_details_screen/complete_profile_screen.dart';
import 'package:e_commerce_app_ui/screens/product_details_screen/details_screen.dart';
import 'package:e_commerce_app_ui/screens/forget_password_screen/forget_password_screen.dart';
import 'package:e_commerce_app_ui/screens/home_screen/home_screen.dart';
import 'package:e_commerce_app_ui/screens/login_sucess_screen/login_sucess_screen.dart';
import 'package:e_commerce_app_ui/screens/otp_screen/otp_screen.dart';
import 'package:e_commerce_app_ui/screens/profile_screen/profile_screen.dart';
import 'package:e_commerce_app_ui/screens/profile_screen/profile_screen.dart';
import 'package:e_commerce_app_ui/screens/sign_in_screen/sign_in_screen.dart';
import 'package:e_commerce_app_ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:e_commerce_app_ui/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUPScreen.routeName: (context) => const SignUPScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OTPScreen.routeName: (context) => const OTPScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),
  ProfileScreen.routeName: (context) => const ProfileScreen(),
};
