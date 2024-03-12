import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:handichatcraft_w1985612/pages/home.dart';
import 'package:handichatcraft_w1985612/pages/rating_page.dart';
import 'package:handichatcraft_w1985612/widget/constant.dart';

class FeedbackPage extends StatefulWidget {
  final double rating;
  const FeedbackPage({super.key, required this.rating});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  double _rating = 0;
  final _feedback = TextEditingController();
  late FirebaseFirestore db;

  void submit() {
    db.collection("Feedbacks").doc().set({
      "clientName": "Anne",
      "rating": _rating,
      "feedback": _feedback.text,
    }).then(
      (value) => print("submitted successfully"),
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    db = FirebaseFirestore.instance;
    _rating = widget.rating;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MyWidget(),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.orange,
          ),
        ),
        body: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: CircleAvatar(
                    radius: 30, // Adjust the radius as needed
                    backgroundColor:
                        Colors.grey, // Set your desired background color
                    child: Icon(
                      Icons.account_circle_rounded,
                      size: 30,
                      color: Colors.orange,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Anne Marie",
                    style: TextStyle(fontSize: 24, color: textDark1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            RatingBar.builder(
              minRating: 1,
              initialRating: widget.rating,
              allowHalfRating: true,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              updateOnDrag: true,
              onRatingUpdate: (rating) => setState(
                () {
                  _rating = rating;
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 50),
              child: Text(
                "Share more about Your Experience",
                style: TextStyle(
                    fontFamily: "Calistoga", color: textDark24, fontSize: 24),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: SizedBox(
                height: 200,
                width: 400,
                child: TextField(
                  controller: _feedback,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: "type something...",
                      filled: true,
                      fillColor: Colors.grey),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.all(10.0),
              width: double.infinity,
              margin: const EdgeInsets.only(right: 120, left: 120, top: 0.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.orange,
              ),
              child: InkWell(
                onTap: () {
                  submit();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RatingPage(),
                    ),
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 30, right: 20),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontFamily: "Lalezar",
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
