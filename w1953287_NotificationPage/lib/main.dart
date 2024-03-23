import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pushnotificationreal/firebase_options.dart';
import 'package:pushnotificationreal/firebase_config.dart';

import 'notification_details.dart';
import 'notification_list.dart';
import 'package:device_preview/device_preview.dart';

//Define a top level named handle which background/terminated message will
///call
///
///To verify things are working, checkout the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {/*
//If you are going to use other Firebase services in the background such as firestore,
//make sure you call 'initialApp' before using other Firebase services.
await Firebase.initializeApp(
  options:DefaultFirebaseConfig.platformOptions);
  print('Handling a background message ${message.messageId}]');*/
print('Title: ${message.notification?.title}');
print('Body: ${message.notification?.body}');
print('Payload: ${message.data}');


}
//Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;


//Initialize the [FlutterLocalNotificationsPlugin] package
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
    apiKey: 'AIzaSyC25pqqQZ9j29JvODsu6Wem4ekIrchteVM',
    appId: '1:853942530418:android:5cfebeb5a44a00c5062deb',
    messagingSenderId: '853942530418',
    projectId: 'push-notifications-real',
    ),
  );
  
  /*runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MessagingExampleApp(),
   ),

 ); 
   //runApp(MessagingExampleApp());
*/

  //Set the background messaging handler early on, as a named-top level function
   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

   if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel',//id
      'High Importance Notifications',//title
      //"This channel is used for important notifications.", //description"
      importance: Importance.high,
    );
flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//create an Android Notification Channel.
///
///We use this channel in the "AndroidManifest.xml" file to override the 
/// default FCM channel to enable heads up notifications.
await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(channel);

//Update iOS foreground notification options to allow 
///heads up notifications.
await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  alert: true,
  badge: true,
  sound: true, 
);

   }
   runApp(MessagingExampleApp());
}
   ///Entry point for the example application.
   class MessagingExampleApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        //useInheritedMediaQuery: true,
      //locale: DevicePreview.locale(context),
      //builder: DevicePreview.appBuilder, 
        debugShowCheckedModeBanner: false,
        title: "Messaging Example App",
        theme: ThemeData.light(),
        routes: {
          '/':(context) => Application(),
          '/message':(context) => MessageView(),

        },
      );
    }
   }
   //Renders the example application.
   class Application extends StatefulWidget{
    @override
    State<StatefulWidget> createState()=> _Application();
   }
   class _Application extends State<Application> {

    FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    void getToken() async {
      final token = _firebaseMessaging.getToken().then((value)=> print("Token:$value"));
      await _firebaseMessaging.requestPermission();
  /*try {
    String? token = await _firebaseMessaging.getToken();
    if (token != null) {
      print("Token: $token");
    } else {
      print("Unable to get FCM token.");
    }
  } catch (e) {
    print("Error getting FCM token: $e");
  }
}*/}
    @override
    void initState() {
      super.initState();
      getToken();

      FirebaseMessaging.instance
      .getInitialMessage().then((RemoteMessage?message) {
        if(message != null) {
          Navigator.pushNamed(
            context,
            '/message',
            arguments: MessageArguments(message, true),
          );
        }
      });

      FirebaseMessaging.onMessage.listen((RemoteMessage message){
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;
        if(notification != null && android != null && !kIsWeb) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                //channel.description,
                

                //TODO add a proper drawable resource to android, for now using
                //one that already exists in example app.
                icon:'launch_background',
              ),
            ),
          );
        }
        
      }
      );

FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  print('A new onMessageOpenedAppevent was published!');
  Navigator.pushNamed(
    context,
    '/message',
    arguments: MessageArguments(message,true),
  );
});
    }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          leading: IconButton(
          onPressed: () {
            //Navigator.push(context,
                //MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        leadingWidth: 100,
      
        actions:[
        
          IconButton(onPressed: (){}, icon:Icon(
            Icons.notifications, color: Colors.orange,
          ))
        ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: Text(
                    'Notification List',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ),
                ),
                MessageList(),
            ]
          ),
        ),
      );
    }
   }

