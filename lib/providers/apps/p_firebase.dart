import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ProviderFirebase extends ChangeNotifier {
  Future<void> firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();

    // RemoteNotification? notification = message.notification;
    // AndroidNotification? android = message.notification!.android;
    var data = jsonDecode(message.data['data']);
    print('INI DATA ' + "$data");
    print(jsonEncode(message));
    print('Handling a background message ${message.messageId}');
  }

  Future<void> firebaseOnMessage() async {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      var data = jsonDecode(message.data['data']);
      print(message.data['data']);

      print(data['payload']['notification']);
      // AndroidNotification? android = message.notification!.android;
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });
  }
}
