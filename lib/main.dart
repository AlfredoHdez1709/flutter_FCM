import 'package:firebase_notification/pages/detalle_page.dart';
import 'package:firebase_notification/pages/home_page.dart';
import 'package:firebase_notification/providers/push_notification_provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    final pushProvider = PushNotificationProvider();
    pushProvider.initNotification();
    pushProvider.mensajesStream.listen((argument) {
      print('Argument from main: $argument');
      navigatorKey.currentState.pushNamed('detalle', arguments: argument);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      navigatorKey: navigatorKey,
      routes: {
        'home': (context) => HomePage(),
        'detalle': (context) => DetallePage(),
      },
    );
  }
}
