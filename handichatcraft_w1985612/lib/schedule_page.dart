import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/booking_confirmed_page.dart';
import 'package:handichatcraft_w1985612/bottom_nav_bar.dart';
import 'package:handichatcraft_w1985612/constant.dart';
import 'package:handichatcraft_w1985612/counselor_model.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:intl/intl.dart';

class ShedulePage extends StatefulWidget {
  final CounselorModel counselor;
  const ShedulePage({super.key, required this.counselor});

  @override
  State<ShedulePage> createState() => _ShedulePageState();
}

class _ShedulePageState extends State<ShedulePage> {
  List<DateTime?> _dates = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.orange,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("asset/images/MaleUser.png"),
              Text(widget.counselor.name,
                  textAlign: TextAlign.center,
                  style: calistogaRegular24PrimaryDark),
              Text(widget.counselor.specialize,
                  textAlign: TextAlign.center,
                  style: calistogaRegular10TextDark),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Select date and time",
                          style: calistogaRegular20TextDark),
                    ),
                    CalendarDatePicker2(
                      config: CalendarDatePicker2Config(),
                      value: _dates,
                      onValueChanged: (dates) {
                        _dates = dates;

                        print(_dates.toString());
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    bottonRow(
                      DateTime.now(),
                      () {
                        print('Button ${1} pressed');
                      },
                    ),
                    bottonRow(
                      DateTime.now(),
                      () {
                        print('Button ${1} pressed');
                      },
                    ),
                    Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.orange),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  const BookingConfirmedpage()));
                        },
                        child: const Text(
                          'Book now',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    BottomNavBar(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget bottonRow(DateTime startTime, Function() callback) {
  return Row(
    children: List<Widget>.generate(3, (int index) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ElevatedButton(
            onPressed: () => callback(),
            child: Text(
                "${DateFormat('HH').format(startTime.add(Duration(hours: index))).toString()} - ${DateFormat('HH').format(startTime.add(Duration(hours: 1 * (index + 1)))).toString()}"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange[50],
            ),
          ),
        ),
      );
    }),
  );
}
