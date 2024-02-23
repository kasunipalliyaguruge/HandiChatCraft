import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    ));
  }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

    @override
      State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
      
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appointments")),
      body: content(),
    );
  }
  Widget content() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
      children: [
        Text("Selected Day = " + today.toString().split(" ")[0]),
        Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(229, 187, 102, 1.0), // #3366FF - Solid color
                  Color.fromRGBO(229, 187, 102, 0.8), // #3366FF with 80% opacity
                  Color.fromRGBO(229, 187, 102, 0.6), // #3366FF with 60% opacity
                ],
                stops: [0.0, 0.5, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
      
  child: TableCalendar (
            locale: "en_US",
            rowHeight: 43,
            headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
            availableGestures: AvailableGestures.all,
            selectedDayPredicate: (day) => isSameDay(day, today),
            focusedDay: today, 
            firstDay: DateTime.utc(2010, 10, 16), 
            lastDay: DateTime.utc(2030, 3, 14),
            onDaySelected: _onDaySelected,
      
        ),
        ),
      ],
    ),
    );
    
  }
}