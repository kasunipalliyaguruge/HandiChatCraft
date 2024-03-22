import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/model/booking_model.dart';
import 'package:handichatcraft_w1985612/pages/booking_confirmed_page.dart';
import 'package:handichatcraft_w1985612/services/email_service.dart';
import 'package:handichatcraft_w1985612/widget/bottom_nav_bar.dart';
import 'package:handichatcraft_w1985612/widget/constant.dart';
import 'package:handichatcraft_w1985612/model/counselor_model.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:handichatcraft_w1985612/widget/time_button.dart';

class SchedulePage extends StatefulWidget {
  final CounselorModel counselor;
  const SchedulePage({super.key, required this.counselor});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  List<DateTime?> _dates = [];
  late BookingModel appointment =
      BookingModel(widget.counselor, "Anne Marie", DateTime.now());
  late FirebaseFirestore db;
  List<int> timeSlots = [];
  List<int> availableTimeSlots = [];
  void getTimeSlots() {
    availableTimeSlots = [10, 11, 12, 14, 15, 16];

    FirebaseFirestore.instance
        .collection('Appointments')
        .where('counselor_name', isEqualTo: appointment.counselor.name)
        .where('dateTime',
            isGreaterThanOrEqualTo:
                DateTime(_dates[0]!.year, _dates[0]!.month, _dates[0]!.day))
        .where('dateTime',
            isLessThanOrEqualTo: DateTime(
                _dates[0]!.year, _dates[0]!.month, _dates[0]!.day, 23, 59, 59))
        .get()
        .then(
      (QuerySnapshot querySnapshot) {
        timeSlots = [];
        querySnapshot.docs.forEach((doc) {
          timeSlots.add((doc["dateTime"] as Timestamp).toDate().hour);
          //print(doc["counselor_name"]);
        });

        setState(() {
          availableTimeSlots
              .removeWhere((element) => timeSlots.contains(element));
        });
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    db = FirebaseFirestore.instance;
    _dates.add(DateTime.now().copyWith(
        hour: 0, minute: 0, second: 0, microsecond: 0, millisecond: 0));

    getTimeSlots();

    super.initState();
  }

  void submit() {
    appointment.dateTime = appointment.dateTime.copyWith(
        day: _dates[0]!.day, month: _dates[0]!.month, year: _dates[0]!.year);
    db.collection("Appointments").doc().set({
      "Client_name": appointment.userName,
      "counselor_name": appointment.counselor.name,
      "dateTime": appointment.dateTime,
    }).then((value) {
      // EmailService emailService = EmailService();
      // emailService.sendEmail();
    });
    print("Appointment successfully");
  }

  void setAppointment(int hour) {
    appointment.dateTime = appointment.dateTime.copyWith(
        hour: hour, minute: 0, second: 0, microsecond: 0, millisecond: 0);
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
        callback: (p0) {},
        index: 4,
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
                    config: CalendarDatePicker2Config(
                        firstDate: DateTime.now().add(const Duration(days: 1))),
                    value: _dates,
                    onValueChanged: (dates) {
                      _dates = dates;
                      getTimeSlots();
                    },
                  ),
                  TimeButton(
                    callBack: setAppointment,
                    hours: availableTimeSlots,
                  ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingConfirmedpage(
                                appointmentDetails: appointment,
                              ),
                            ));
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
          ],
        ),
      ),
    );
  }
}
