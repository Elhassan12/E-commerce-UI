import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/size_config.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';

class OTPForm extends StatefulWidget {
  const OTPForm({Key? key}) : super(key: key);

  @override
  State<OTPForm> createState() => _OTPFormState();
}

class _OTPFormState extends State<OTPForm> {
 late FocusNode focusNode2;
 late FocusNode focusNode3;
 late FocusNode focusNode4;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode2 =FocusNode();
    focusNode3 =FocusNode();
    focusNode4 =FocusNode();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
  }
  void nextField(FocusNode focusNode,String value){
   if(value.length == 1){
     otpNumber.add(value);
     focusNode.requestFocus();
   }
  }


  final _formKey = GlobalKey<FormState>();
 List<String> otpNumber = [];

  @override
  Widget build(BuildContext context) {
    return Form(child: Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight*0.11,),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           SizedBox(
               width: getProportionateScreenWidth(60),
               child: TextFormField(
                 obscureText: true,
                 textAlign: TextAlign.center,
                 keyboardType: TextInputType.number,
                 style: TextStyle(fontSize: getProportionateScreenWidth(24)),
                 autofocus: true,
                 decoration: buildInputDecoration(),
                 onChanged: (value){
                   nextField(focusNode2, value);
                 },
               )
           ),
           SizedBox(
               width: getProportionateScreenWidth(60),
               child: TextFormField(
                 obscureText: true,
                 textAlign: TextAlign.center,
                 keyboardType: TextInputType.number,
                 style: TextStyle(fontSize: getProportionateScreenWidth(24)),
                 focusNode: focusNode2,
                 decoration: buildInputDecoration(),
                 onChanged: (value){
                   nextField(focusNode3, value);
                 },
               )
           ),
           SizedBox(
               width: getProportionateScreenWidth(60),
               child: TextFormField(
                 obscureText: true,
                 textAlign: TextAlign.center,
                 keyboardType: TextInputType.number,
                 style: TextStyle(fontSize: getProportionateScreenWidth(24)),
                 focusNode: focusNode3,
                 decoration: buildInputDecoration(),
                 onChanged: (value){
                   nextField(focusNode4, value);
                 },
               )
           ),
           SizedBox(
             width: getProportionateScreenWidth(60),
             child: TextFormField(
               obscureText: true,
               textAlign: TextAlign.center,
               keyboardType: TextInputType.number,
               style: TextStyle(fontSize: getProportionateScreenWidth(24)),
               focusNode: focusNode4,
               decoration: buildInputDecoration(),
               onChanged: (value){
                 if(value.length == 1){
                   focusNode4.unfocus();
                 }
               },
             ),
           ),
         ],
       ),
        SizedBox(height: SizeConfig.screenHeight*0.17,),
        DefaultButton(text: "Continue",onPressed:(){
          },),
        SizedBox(height: SizeConfig.screenHeight*0.16,),
        Text("Resend OTP Code",style: TextStyle(
          decoration: TextDecoration.underline
        ),),
      ],
    ));
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
            enabledBorder: buildOutlineInputBorder(),
            border: buildOutlineInputBorder(),
            focusedBorder: buildOutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),

        );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
              borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
              borderSide: BorderSide(color: Constants.kTextColor),
            );
  }
}
