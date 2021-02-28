import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajeStreamController = StreamController<String>.broadcast();

  Stream<String> get mensajesStream => _mensajeStreamController.stream;

  static Future<dynamic> onBackgroundMessage(
      Map<String, dynamic> message) async {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

  initNotification() async {
    await _firebaseMessaging.requestNotificationPermissions();
    final token = await _firebaseMessaging.getToken();
    print('===== FCM Token ========');
    print(token);

    _firebaseMessaging.configure(
      onMessage: onMessage,
      onBackgroundMessage: onBackgroundMessage,
      onLaunch: onLaunch,
      onResume: onResume,
    );
  }

  Future<dynamic> onMessage(Map<String, dynamic> message) {
    print('========== onMessage============');
    final argument = message['data']['comida'] ?? 'no-data';
    _mensajeStreamController.sink.add(argument);
  }

  Future<dynamic> onLaunch(Map<String, dynamic> message) {
    print('========== onLaunch============');

    final argument = message['data']['comida'] ?? 'no-data';
    _mensajeStreamController.sink.add(argument);
  }

  Future<dynamic> onResume(Map<String, dynamic> message) {
    print('========== onResume============');

    final argument = message['data']['comida'] ?? 'no-data';
    _mensajeStreamController.sink.add(argument);
  }

  disponse() {
    _mensajeStreamController?.close();
  }
}
