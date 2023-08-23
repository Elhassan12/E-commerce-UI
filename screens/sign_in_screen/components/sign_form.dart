import 'package:e_commerce_app_ui/screens/forget_password_screen/forget_password_screen.dart';
import 'package:e_commerce_app_ui/screens/login_sucess_screen/login_sucess_screen.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../components/no_account_text.dart';
import '../../../components/social_card.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../splash/body.dart';
import 'body.dart';
import 'custom_suffix_icon.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final List<String> errors = [];

  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error!);
      });
  }

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildEmailTextForm(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPassWordTextForm(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Row(
            children: [
              Checkbox(value: remember, onChanged: (value){
                setState(() {
                  remember = value!;
                });
              },
                activeColor: Constants.kPrimaryColor,
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                },
                child: Text("forget password",style: TextStyle(
                  decoration: TextDecoration.underline,
                ),),
              ),
            ],
          ),
          FormError(errors: errors),
          SizedBox(
            height: getProportionateScreenHeight(39),
          ),
          DefaultButton(text: "Sign In", onPressed: () {
            print("errors length ${errors.length} on pressed");
            if(_formKey.currentState!.validate()){
              _formKey.currentState!.save();
              if (Constants.emailValidatorRegExp.hasMatch(email)) {
                removeError(error: Constants.kInvalidEmailError);
              }
              if(password.length >= 8){
                removeError(error:Constants.kShortPassError);
              }
              Navigator.pushNamed(context, LoginSuccessScreen.routeName);
            }
          }),
          SizedBox(
            height: getProportionateScreenHeight(40),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialCard(image: "assets/icons/google-icon.svg",onPress: (){},),
              SocialCard(image: "assets/icons/facebook-2.svg",onPress: (){},),
              SocialCard(image: "assets/icons/twitter.svg",onPress: (){},),
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          NoAccountText(),
        ],
      ),
    );
  }
  TextFormField buildPassWordTextForm() {
    return TextFormField(
      onSaved: (newValue){ password = newValue!;},
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error:Constants.kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: Constants.kShortPassError);
        }
        return null;
      },
      validator:(value) {
        if (value!.isEmpty) {
          addError(error: Constants.kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: Constants.kShortPassError);
          return "";
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        hintText: "enter your Password",
        labelText: "Password",
        suffixIcon: CustomSuffixIcon(suffixIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }

  TextFormField buildEmailTextForm() {
    return TextFormField(
      onSaved: (newValue){ email = newValue!;},
      onChanged:  (value) {
        if (!value.isEmpty) {
          removeError(error:Constants.kEmailNullError);

        }else if(Constants.emailValidatorRegExp.hasMatch(value)){
          removeError(error:Constants.kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error:Constants.kEmailNullError);
          return "";
        }else if(!Constants.emailValidatorRegExp.hasMatch(value)){
          print('enter valid email');
          addError(error:Constants.kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "enter your Email",
        labelText: "Email",
        suffixIcon: CustomSuffixIcon(suffixIcon: 'assets/icons/Mail.svg'),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

}