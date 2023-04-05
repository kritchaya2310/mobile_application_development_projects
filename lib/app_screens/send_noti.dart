import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';

class SendNoti extends StatefulWidget {
  const SendNoti({Key? key}) : super(key: key);

  @override
  State<SendNoti> createState() => _SendNotiState();
}

class _SendNotiState extends State<SendNoti> {
  String? mToken = " ";
  late FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin =
      FlutterLocalNotificationsPlugin();
  TextEditingController username = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void initInfo() {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
        android: androidInitialize,
        iOS: null // if you don't need iOS initialization
        );
    // flutterLocalNotificationPlugin.initialize(initializationSettings,
    //     onDidReceiveLocalNotification:
    //         (int id, String? title, String? body, String? payload) async {
    //   try {
    //     if (payload != null && payload.isNotEmpty) {
    //       //
    //     } else {
    //       //
    //     }
    //   } catch (e) {
    //     //
    //   }
    // });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print('................onMessage................');
      print(
          'onMessage: ${message.notification?.title}/${message.notification?.body}');

      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );

      AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        "dbfood",
        "dbfood",
        importance: Importance.high,
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        playSound: true,
      );

      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);
      await flutterLocalNotificationPlugin.show(1, message.notification?.title,
          message.notification?.body, platformChannelSpecifics);
    });
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        mToken = token;
        print("My token is $mToken");
      });
      saveToken(token!);
    });
  }

  void saveToken(String token) async {
    await FirebaseFirestore.instance.collection("UserTokens").doc("User2").set({
      'token': token,
    });
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    //   print('User granted permission');
    // } else if (settings.authorizationStatus ==
    //     AuthorizationStatus.provisional) {
    //   print('User granted provisional permission');
    // } else {
    //   print('User declined or has not accepted permission');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                TextFormField(
                  controller: username,
                ),
                TextFormField(
                  controller: title,
                ),
                TextFormField(
                  controller: body,
                ),
                GestureDetector(
                  onTap: () async {
                    String name = username.text.trim();
                    String titleText = title.text;
                    String bodyText = body.text;
                  },
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.5))
                        ]),
                    child: Center(
                      child: const Text("Send Noti"),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
