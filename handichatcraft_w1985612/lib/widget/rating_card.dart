import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:handichatcraft_w1985612/model/feedback_model.dart';

class RatingCard extends StatelessWidget {
  final FeedbackModel feedback;
  const RatingCard({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      width: 300.0, // Set the desired width
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      // Set the desired height

      child: ListTile(
        leading: Icon(Icons.account_circle_rounded,
            size: 40.0, color: Colors.orange),
        title: Text(feedback.clientName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            RatingBar.builder(
              initialRating: feedback.rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20.0,
              itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                // Handle rating updates here
              },
            ),
            SizedBox(
              height: 5,
            ),
            Text(feedback.feedback)
          ],
        ),

        // Text and Rating Bar on the right
      ),
    ));
  }
}
