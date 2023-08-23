import 'package:e_commerce_app_ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../components/heading_style.dart';
import '../../../constants.dart';
import '../../otp_screen/otp_screen.dart';
import '../../sign_in_screen/components/custom_suffix_icon.dart';
import '../../splash/body.dart';

class CompleteProfileForm extends StatefulWidget {
  const CompleteProfileForm({Key? key}) : super(key: key);

  @override
  State<CompleteProfileForm> createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {

  final List<String> errors = [];

  final _formKey = GlobalKey<FormState>();
  late String firstName;
  late String lastName;
  late String phone;
  late String address;

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
          buildFirstNameTextForm(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildLastNameTextForm(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildPhoneTextForm(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildAddressTextForm(),
          SizedBox(height: getProportionateScreenHeight(30),),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(5),),
          DefaultButton(
              text: "Continue",
              onPressed: () {
                // if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  removeError(error: Constants.kAddressNullError);
                  removeError(error: Constants.kNamelNullError);
                  removeError(error: Constants.kPhoneNumberNullError);
                // }
                Navigator.pushNamed(context, OTPScreen.routeName,arguments:{
                  "phone":phone,

                });
              }),



        ],
      )),
    );
  }

  TextFormField buildFirstNameTextForm() {
    return TextFormField(
      onSaved: (newValue) {
         firstName= newValue!;
      },
      onChanged: (value) {
        if (!value.isEmpty) {
          removeError(error: Constants.kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your FirstName",
        labelText: "FirstName",
        suffixIcon: CustomSuffixIcon(suffixIcon: 'assets/icons/User.svg'),
      ),
      keyboardType: TextInputType.name,
    );
  }
  TextFormField buildLastNameTextForm() {
    return TextFormField(
      onSaved: (newValue) {
        lastName= newValue!;
      },
      onChanged: (value) {
        if (!value.isEmpty) {
          removeError(error: Constants.kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your LastName",
        labelText: "LastName",
        suffixIcon: CustomSuffixIcon(suffixIcon: 'assets/icons/User.svg'),
      ),
      keyboardType: TextInputType.name,
    );
  }
  TextFormField buildPhoneTextForm() {
    return TextFormField(
      onSaved: (newValue) {
        phone= newValue!;
      },
      onChanged: (value) {
        if (!value.isEmpty) {
          removeError(error: Constants.kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your Phone Number",
        labelText: "Phone",
        suffixIcon: CustomSuffixIcon(suffixIcon: 'assets/icons/Phone.svg'),
      ),
      keyboardType: TextInputType.phone,
    );
  }
  TextFormField buildAddressTextForm() {
    return TextFormField(
      onSaved: (newValue) {
        address= newValue!;
      },
      onChanged: (value) {
        if (!value.isEmpty) {
          removeError(error: Constants.kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: Constants.kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: "Enter your Address",
        labelText: "Address",
        suffixIcon: CustomSuffixIcon(suffixIcon: 'assets/icons/Location point.svg'),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
