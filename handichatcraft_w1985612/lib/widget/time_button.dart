import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/widget/constant.dart';
import 'package:intl/intl.dart';

class TimeButton extends StatefulWidget {
  final List<int> hours;
  final Function(int) callBack;
  const TimeButton({super.key, required this.hours, required this.callBack});

  @override
  State<TimeButton> createState() => _TimeButtonState();
}

class _TimeButtonState extends State<TimeButton> {
  int selectedtime = -1;
  List<DateTime> timeSlots = [];

  @override
  void didUpdateWidget(TimeButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    timeSlots = widget.hours.map((hour) => DateTime(2000, 1, 1, hour)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: timeSlots.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(right: 8),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              selectedtime = index;
            });
            widget.callBack(timeSlots[index].hour);
          },
          child: Text(
              "${DateFormat('HH a').format(timeSlots[index]).toString()} - ${DateFormat('HH a').format(timeSlots[index].add(Duration(hours: 1))).toString()}"),
          style: ElevatedButton.styleFrom(
              backgroundColor: selectedtime == index
                  ? primaryColor
                  : const Color.fromARGB(255, 228, 197, 157),
              textStyle: const TextStyle(
                color: Colors.black38,
              )),
        ),
      ),
    );
  }
}
