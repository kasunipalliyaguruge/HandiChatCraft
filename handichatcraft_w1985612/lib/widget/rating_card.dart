import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

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
        leading: const Column(
          children: [
            Icon(Icons.account_circle_rounded,
                size: 40.0, color: Colors.orange),
          ],
        ),
        title: const Row(
          children: [
            Text('anne'),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Row(
                children: [
                  const SizedBox(height: 8.0),
                  RatingBar.builder(
                    initialRating: 0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20.0,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      // Handle rating updates here
                    },
                  ),

                  // Rating Bar
                ],
              ),
            ],
          ),
        ),

        // Text and Rating Bar on the right
      ),
    ));
  }
}
