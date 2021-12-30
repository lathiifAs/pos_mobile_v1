import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:pointofsales/core/providers.dart';

import 'package:pointofsales/utils/constants.dart';
import 'package:pointofsales/views/components/splashscreen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  await GetStorage.init();
  initializeDateFormatting('id-ID');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderListener.listProvider,
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Point of Sales",
          theme: ThemeData(
              scaffoldBackgroundColor: kBackgroundColor,
              snackBarTheme: SnackBarThemeData(actionTextColor: Colors.white),
              appBarTheme: AppBarTheme(
                backgroundColor: kPrimaryColor,
                iconTheme: IconThemeData(
                  color: Colors.white, //change your color here
                ),
              ),
              primaryColor: kPrimaryColor,
              accentColor: kPrimaryColor,
              focusColor: kPrimaryColor,
              textTheme:
                  Theme.of(context).textTheme.apply(fontFamily: "Poppins"),
              fontFamily: "Poppins"),
          home: SplashScreen()),
    );
  }
}
