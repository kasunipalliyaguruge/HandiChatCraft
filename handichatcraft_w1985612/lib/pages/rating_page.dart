import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:handichatcraft_w1985612/pages/feedback_page.dart';
import 'package:handichatcraft_w1985612/widget/constant.dart';
import 'package:handichatcraft_w1985612/widget/rating_card.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  double rating = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const RatingPage(),
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
                    onRatingUpdate: (newRating) {
                      setState(() {
                        rating = newRating;
                      });
                      if (rating >= 1.0) {
                        // Navigate to the feedback page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FeedbackPage(),
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
                        fontFamily: "Calistoga",
                        color: textDark24,
                        fontSize: 24),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const RatingCard(
                  title: "Mr.Anne", subtitle: "very useful application"),
            ],
          ),
        ),
      ),
    );
  }
}
