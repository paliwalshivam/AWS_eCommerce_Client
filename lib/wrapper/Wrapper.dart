import 'package:flutter/material.dart';
import 'package:shop_app/wrapper/components/wrapperBody.dart';

import '../size_config.dart';

class Wrapper extends StatelessWidget {
  static String routeName = '/wrapper';
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: WrapperBody(),
    );
  }
}
