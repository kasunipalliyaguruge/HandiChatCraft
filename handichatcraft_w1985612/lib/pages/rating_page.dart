import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:handichatcraft_w1985612/model/feedback_model.dart';
import 'package:handichatcraft_w1985612/pages/feedback_page.dart';
import 'package:handichatcraft_w1985612/pages/home.dart';
import 'package:handichatcraft_w1985612/widget/constant.dart';
import 'package:handichatcraft_w1985612/widget/rating_card.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double rating = 0;
  List<FeedbackModel> feedbacks = [];
  void getFeedbacks() {
    FirebaseFirestore.instance
        .collection('Feedbacks')
        .where('clientName', isEqualTo: 'Anne')
        .get()
        .then(
      (querySnapshot) {
        setState(() {
          feedbacks = querySnapshot.docs
              .map((doc) => FeedbackModel.fromFirestore(doc))
              .toList();
        });
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    getFeedbacks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40, // Adjust the radius as needed
                backgroundColor:
                    Colors.grey, // Set your desired background color
                child: Text(
                  ' $rating.0',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.deepOrangeAccent,
                  ),
                ),
              ),
              RatingBar.builder(
                minRating: 1,
                initialRating: 0,
                allowHalfRating: true,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                updateOnDrag: true,
                onRatingUpdate: (newRating) async {
                  setState(() {
                    rating = newRating;
                  });
                  await Future.delayed(Duration(seconds: 2));
                  if (rating >= 1.0) {
                    // Navigate to the feedback page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FeedbackPage(
                          rating: rating,
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const SizedBox(
            child: Padding(
              padding: EdgeInsets.only(left: 40, right: 50),
              child: Text(
                "Rate your experience and make a feedback",
                style: TextStyle(
                    fontFamily: "Calistoga", color: textDark24, fontSize: 24),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: feedbacks.length,
            itemBuilder: (context, index) => RatingCard(
              feedback: feedbacks[index],
            ),
          ),
        ],
      ),
    );
  }
}
