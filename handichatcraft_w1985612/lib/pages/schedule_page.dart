import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/model/booking_model.dart';
import 'package:handichatcraft_w1985612/pages/booking_confirmed_page.dart';
import 'package:handichatcraft_w1985612/widget/bottom_nav_bar.dart';
import 'package:handichatcraft_w1985612/widget/button_row.dart';
import 'package:handichatcraft_w1985612/widget/constant.dart';
import 'package:handichatcraft_w1985612/model/counselor_model.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:handichatcraft_w1985612/widget/time_button.dart';

class ShedulePage extends StatefulWidget {
  final CounselorModel counselor;
  const ShedulePage({super.key, required this.counselor});

  @override
  State<ShedulePage> createState() => _ShedulePageState();
}

class _ShedulePageState extends State<ShedulePage> {
  List<DateTime?> _dates = [];
  late BookingModel appointment =
      BookingModel(widget.counselor, "Anne", DateTime.now());
  late FirebaseFirestore db;
  @override
  void initState() {
    // TODO: implement initState
    db = FirebaseFirestore.instance;
    super.initState();
  }

  void submit() {
    appointment.dateTime = appointment.dateTime.copyWith(
        day: _dates[0]!.day, month: _dates[0]!.month, year: _dates[0]!.year);
    db.collection("Appointments").doc().set({
      "Client_name": appointment.userName,
      "counselor_name": appointment.counselor.name,
      "dateTime": appointment.dateTime,
    });
    print("Appointment successfully");
  }

  void setAppointment(DateTime dateTime) {
    appointment.dateTime = appointment.dateTime.copyWith(
        hour: dateTime.hour,
        minute: 0,
        second: 0,
        microsecond: 0,
        millisecond: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.orange,
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        callback: (int) {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("asset/images/MaleUser.png"),
            Text(widget.counselor.name,
                textAlign: TextAlign.center,
                style: calistogaRegular20PrimaryDark),
            Text(widget.counselor.specialize,
                textAlign: TextAlign.center, style: calistogaRegular10TextDark),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Select date and time",
                        style: calistogaRegular16TextDark),
                  ),
                  CalendarDatePicker2(
                    config: CalendarDatePicker2Config(),
                    value: _dates,
                    onValueChanged: (dates) {
                      _dates = dates;

                      print(_dates.toString());
                    },
                  ),
                  TimeSelector(
                      startTime: DateTime.now().copyWith(hour: 10),
                      callback: setAppointment),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: primaryColor),
                    child: InkWell(
                      onTap: () {
                        submit();
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => BookingConfirmedpage(
                                appointmentDetails: appointment),
                          ),
                        );
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
                ],
              ),
            ),
            TimeButton(),
          ],
        ),
      ),
    );
  }
}
