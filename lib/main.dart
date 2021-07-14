import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/amplifyconfiguration.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/singeltons/isAmplifyConfigured.dart';
import 'package:shop_app/theme.dart';
import 'package:shop_app/singeltons/emailAddress.dart';
import 'package:shop_app/utils/selectedProductData.dart';
import 'package:shop_app/wrapper/Wrapper.dart';
import 'package:shop_app/models/ModelProvider.dart';
import 'package:shop_app/repository/cartRepository.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void _configureAmplify() async {
    final _amplifyInstance = Amplify;
    try{
      await _amplifyInstance.addPlugins([
        AmplifyAuthCognito(),
        AmplifyAPI(),
        AmplifyDataStore(modelProvider: ModelProvider.instance),
      ]);
      await _amplifyInstance.configure(amplifyconfig);
      print("Successfully Configured Amplify");
      setState(() {
        keyData.text = "Configured";
      });
    }catch (e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EmailProvider()),
        ChangeNotifierProvider(create: (context) => SelectedProductData()),
        Provider(create: (context)=> ProductRepository()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme(),
        initialRoute: Wrapper.routeName,
        routes: routes,
      ),
    );
  }
}
