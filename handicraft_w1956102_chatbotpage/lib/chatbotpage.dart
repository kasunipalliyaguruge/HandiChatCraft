// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:handicraft_w1956102_chatbotpage/messages.dart';

class Chatbotpage extends StatefulWidget {
  const Chatbotpage({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _ChatbotpageState createState() => _ChatbotpageState();
}

class _ChatbotpageState extends State<Chatbotpage> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
            width: 50,
            height: 50,
            child: Image.asset(
              'lib/icons/chat-bot.png',
              fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 8),
            Text(
              'HandiBot',
              style: TextStyle(
                fontSize: 25,
                color: Colors.orange,
                fontWeight: FontWeight.bold,
              ),
            )
          ], 
        ),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessagesScreen(messages: messages)),
            Text(
              'HandiBot gives you answers to questions about handicrafts such as Batik, Masks, Handicrafts, Pottery, Jewelry, and Basket.',
               style: TextStyle(
                color: Colors.orange,
                fontSize: 15,
                fontWeight: FontWeight.bold,
               ),
              ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              color: Color.fromARGB(255, 231, 231, 230),
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _controller,
                    style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  )),
                  IconButton(
                      onPressed: () {
                        sendMessage(_controller.text);
                        _controller.clear();
                      },
                      icon: Icon(Icons.send))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      // ignore: avoid_print
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}