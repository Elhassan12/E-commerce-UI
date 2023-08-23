import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import '../../sign_in_screen/components/custom_suffix_icon.dart';
import '../../splash/body.dart';

class ForgetPasswordForm extends StatefulWidget {
  const ForgetPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
}

class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
  late String email;
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];

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
            buildEmailFormField(),
            FormError(errors: errors),
            SizedBox(
              height: getProportionateScreenHeight(140),
            ),
            DefaultButton(
                text: "Continue",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (Constants.emailValidatorRegExp.hasMatch(email)) {
                      removeError(error: Constants.kInvalidEmailError);
                    }
                  }
                }),
          ],
        ));
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "enter your email",
          labelText: "Email",
          suffixIcon: CustomSuffixIcon(suffixIcon: "assets/icons/Mail.svg")),
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        email = value!;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
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
          addError(error: Constants.kInvalidEmailError);
          return "";
        }
        return null;
      },
    );
  }
}