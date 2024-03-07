import 'package:flutter/material.dart';

class TimeButton extends StatefulWidget {
  const TimeButton({super.key});

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  List<String> timeSlot = [
    "9.00 a.m - 10.00 a.m",
    "10.00 a.m-11.00 a.m",
    "11.00 a.m-12.00 p.m",
    "13.00 p.m-14.00 p.m",
    "14.00 p.m-15.00 p.m",
    "15.00 a.m-16.00 p.m"
  ];

  late int Selectedtime = -1;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: timeSlot.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 8, bottom: 8, top: 8),
          child: Container(
            height: 80, // Adjust the height as needed
            width: 180, // Adjust the width as needed

            child: ElevatedButton.icon(
                onPressed: () {}, label: Text(timeSlot[index])),
          ),
        ),
      ),
    );
  }
}
