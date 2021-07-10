import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/loading.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/singeltons/isAmplifyConfigured.dart';

class WrapperBody extends StatefulWidget {
  const WrapperBody({Key key}) : super(key: key);

  @override
  _WrapperBodyState createState() => _WrapperBodyState();
}

class _WrapperBodyState extends State<WrapperBody> {
  @override
  Widget build(BuildContext context) {
    if (keyData.text == "Configured") {
      return FutureBuilder(
          future: Amplify.Auth.getCurrentUser(),
          builder: (context, AsyncSnapshot<AuthUser> snapshot) {
            if (snapshot.hasData) {
              Future.delayed(Duration.zero, () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
              });
              return Container();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              Future.delayed(Duration.zero, () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Loading()));
              });
              return Container();
            } else {
              Future.delayed(Duration.zero, () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInScreen()));
              });
              return Container();
            }
          });
    } else {
      return Container();
    }
  }
}
