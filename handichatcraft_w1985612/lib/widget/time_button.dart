import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/widget/constant.dart';
import 'package:intl/intl.dart';

class TimeButton extends StatefulWidget {
  final List<int> hours;
  const TimeButton({super.key, required this.hours});

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  late int selectedtime = -1;
  late List<DateTime> timeSlots;

  @override
  void initState() {
    setState(() {
      timeSlots =
          widget.hours.map((hour) => DateTime(2000, 1, 1, hour)).toList();
    });

    print(timeSlots);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: timeSlots.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(right: 8),
          child: Container(
            height: 10, // Adjust the height as needed
            width: 150, // Adjust the width as needed

            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedtime = index;
                });
              },
              child: Text(
                  "${DateFormat('HH a').format(timeSlots[index]).toString()} - ${DateFormat('HH a').format(timeSlots[index].add(Duration(hours: 1))).toString()}"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: selectedtime == index
                      ? primaryColor
                      : const Color.fromARGB(255, 228, 197, 157),
                  textStyle: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
