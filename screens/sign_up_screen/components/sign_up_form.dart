import 'package:e_commerce_app_ui/screens/complete_details_screen/complete_profile_screen.dart';
import 'package:e_commerce_app_ui/screens/complete_details_screen/components/complete_profile_form.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../sign_in_screen/components/custom_suffix_icon.dart';
import '../../splash/body.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final List<String> errors = [];

  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  late String confirmPassword;

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
    return SizedBox(
      width: double.infinity,
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenHeight(50),
              ),
              buildEmailTextForm(),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              buildPassWordTextForm(),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              buildConfirmPassWordTextForm(),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              FormError(errors: errors),
              DefaultButton(
                  text: "Continue",
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      removeError(error: Constants.kInvalidEmailError);
                      removeError(error: Constants.kShortPassError);
                      removeError(error: Constants.kMatchPassError);
                      removeError(error: Constants.kPassNullError);
                      Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                    }
                  // }
                  ),
            ],
          )),
    );
  }

  TextFormField buildPassWordTextForm() {
    return TextFormField(
      onSaved: (newValue) {
        password = newValue!;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: Constants.kShortPassError);
        }
        password = value;
        return null;
      },
      validator: (value) {
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

  TextFormField buildConfirmPassWordTextForm() {
    return TextFormField(
      onSaved: (newValue) {
        confirmPassword = newValue!;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Constants.kPassNullError);
        } else if (value.isNotEmpty && password == confirmPassword) {
          removeError(error: Constants.kMatchPassError);
        }
        confirmPassword = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: Constants.kMatchPassError);
          return "";
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(
        hintText: "re-enter your Password",
        labelText: "confirm password",
        suffixIcon: CustomSuffixIcon(suffixIcon: 'assets/icons/Lock.svg'),
      ),
    );
  }

  TextFormField buildEmailTextForm() {
    return TextFormField(
      onSaved: (newValue) {
        email = newValue!;
      },
      onChanged: (value) {
        print(Constants.emailValidatorRegExp.hasMatch(value).toString() +
            "email");
        if (!value.isEmpty) {
          removeError(error: Constants.kEmailNullError);
        } else if (Constants.emailValidatorRegExp.hasMatch(value)) {
          removeError(error: Constants.kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kEmailNullError);
          return "";
        } else if (!Constants.emailValidatorRegExp.hasMatch(value)) {
          print('enter valid email');
          addError(error: Constants.kInvalidEmailError);
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