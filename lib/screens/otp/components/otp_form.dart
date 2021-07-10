import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/singeltons/emailAddress.dart';
import '../../../constants.dart';
import '../../complete_profile/complete_profile_screen.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    Key key,
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;
  String otp;
  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  autofocus: true,
                  obscureText: false,
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                    setState(() {
                      otp = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    setState(() {
                      otp = otp + value;
                    });
                    nextField(value, pin3FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    setState(() {
                      otp = otp + value;
                    });
                    nextField(value, pin4FocusNode);
                  } ,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    setState(() {
                      otp = otp +value;
                    });
                    nextField(value, pin5FocusNode);
                  } ,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin5FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    setState(() {
                      otp = otp + value;
                    });
                    nextField(value, pin6FocusNode);
                  } ,
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(50),
                child: TextFormField(
                  focusNode: pin6FocusNode,
                  obscureText: false,
                  style: TextStyle(fontSize: 20),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value){
                    if (value.length == 1) {
                      pin6FocusNode.unfocus();
                    }
                    setState(() {
                      otp = otp + value;
                    });
                  }
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () async{
              final emailAddress = Provider.of<EmailProvider>(context,listen: false);
              print(otp);
              try{
                var otpResult = await Amplify.Auth.confirmSignUp(username: emailAddress.emailAddress, confirmationCode: otp);
                if(otpResult.isSignUpComplete){
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                }
              }catch (e){
                print(e.toString());
              }

            },
          )
        ],
      ),
    );
  }
}
