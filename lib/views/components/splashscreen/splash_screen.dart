import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pointofsales/providers/admin/p_auth.dart';
import 'package:pointofsales/providers/apps/p_app.dart';
import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/utils/size_config.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Provider.of<ProviderApp>(context, listen: false).checkForUpdate();
    Future.delayed(
        Duration(seconds: 3),
        () => Provider.of<ProviderAuth>(context, listen: false)
            .userSession(context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: SizeConfig.screenWidth * 0.4,
              ),
              SizedBox(
                height: kDefaultPadding,
              ),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: kPrimaryColor,
              )
            ],
          ),
        ));
  }
}
// rgb(4,118,78)
