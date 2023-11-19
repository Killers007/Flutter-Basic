import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/materi/firebase%20integration/entities/notification_entitiy.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notification',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.greenAccent.shade700,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  Map<String, dynamic> data = {};

  @override
  void initState() {
    super.initState();

    // Configure FCM
    _configureFCM();
  }

  void _configureFCM() {
    _firebaseMessaging.getToken().then((token) {
      print("FCM Token: $token");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received message: $message");
      data = message.data;
      // data = NotificationEntity.fromJson(message.data);
      setState(() {});
      // Handle the received message
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("Message opened app: $message");
      // Handle the message when the app is in the foreground
    });
  }

  @override
  Widget build(BuildContext context) {
    final notificationData =
        data.isNotEmpty ? NotificationEntity.fromJson(data) : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('FCM Notification Demo'),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: Colors.grey.shade200, // Border color
            width: 1.5, // Border width
          ),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            notificationData?.image != ''
                ? Image.network(
                    notificationData?.image ?? '',
                    fit: BoxFit.cover,
                  )
                : Container(),
            const SizedBox(height: 10),
            Text(
              notificationData?.title ?? 'Title not available',
              style: const TextStyle(fontSize: 18),
              overflow: TextOverflow.clip,
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: Text(
                notificationData?.body ?? 'Body not available',
                overflow: TextOverflow.clip,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
