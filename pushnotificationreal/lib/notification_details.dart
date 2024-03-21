import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

//Message Route Arguments
class MessageArguments {
  ///The remote Message
  final RemoteMessage message;

  ///Wheather this message caused the application to open.
  final bool openedApplication;
  //ignore:public_member_api_docs
MessageArguments(this.message, this.openedApplication);
}
///Display information about a [RemoteMessage].
class MessageView extends StatelessWidget {
@override
Widget build(BuildContext context){
  final MessageArguments args = ModalRoute.of(context)!.settings.arguments!as MessageArguments;
  RemoteMessage message = args.message;
  RemoteNotification? notification = message.notification;

  return Scaffold(
    appBar:AppBar(
      title: appBar(message.data.toString() ),
    ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(children: [
            if (notification!= null)...[
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    img(notification.android!.imageUrl,),
                    const Text('Notification information:',
                    style: TextStyle(fontSize: 18),
                    ),
                    viewData(
                      'Client Name',
                      notification.title,
                    ),
                    viewData(
                      'Counselor Name',
                      notification.body,
                    ),
                    viewData(
                      'Date Time',
                      notification.body,
                    ),
                    viewData('Sent Time', message.sentTime?.toString()),
                  ],
                ),
                )
            ],
          ],

          ),)),


    );
}

///A single data row,
Widget viewData(String title, String?value) {
  return Padding(
    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title:',style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(value ??'N/A',),
          ),
      ],
      ),
      );
}

Widget img(String? value) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 4.0,
      child: Center(
        child:Image.network(
          value?? 'https://img.icon8.com/bubbles/2x/appointment-reminders.png',
          height: 200,
          width: 200,
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}
Widget appBar(String? value) {
  return Text(value ??'N/A',style: TextStyle(fontSize: 16),);
}
}
