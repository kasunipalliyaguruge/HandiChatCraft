import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/booking_card.dart';
import 'package:handichatcraft_w1985612/booking_model.dart';
import 'package:handichatcraft_w1985612/constant.dart';
import 'package:handichatcraft_w1985612/counselor_model.dart';

class BookingConfirmedpage extends StatelessWidget {
  const BookingConfirmedpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor50,
        leading: IconButton(
          onPressed: () {
             Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: white,
        ),
      ),
      backgroundColor: primaryColor50,
      body: Expanded(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            background(context),
            Align(
              alignment: Alignment.center,
              child: BookingCard(
                  bookingModel: BookingModel(
                      CounselorModel("name", "nnmmm", "ggj"),
                      "Nimal",
                      DateTime.now())),
            )
          ],
        ),
      ),
    );
  }
}

Widget background(BuildContext context) => Column(
      children: [
        const Icon(
          Icons.check_circle, // Change to your preferred icon
          color: Colors.white,
          size: 60.0,
        ),
        const SizedBox(height: 8.0),
        const Text('Booking Confirmed', style: calistogaRegular24white),
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
          ),
        ),
      ],
    );
