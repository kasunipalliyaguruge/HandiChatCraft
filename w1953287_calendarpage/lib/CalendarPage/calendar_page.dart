import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:table_calendar/table_calendar.dart' as TableCalendar;
import 'package:w1953287_calendarpage/model/booking_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
    primaryColor: Colors.blue,
    // ... other theme properties
  ),
      debugShowCheckedModeBanner: false,

      home: CalendarPage(),
      
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late TableCalendar.CalendarFormat _calendarFormat;
  late List<DateTime> _selectedDates = [];
  late List<BookingModel> _appointments;
  late FirebaseFirestore _db;

  @override
  void initState() {
    super.initState();
    _calendarFormat = TableCalendar.CalendarFormat.week;
    _appointments = [];
    _db = FirebaseFirestore.instance;
    _loadAppointments();
  }

  void _loadAppointments() {
    _db.collection('Appointments').get().then((querySnapshot) {
      setState(() {
        _appointments = querySnapshot.docs
            .map((doc) => BookingModel.fromSnapshot(doc))
            .toList();
      });
    });
  }

  List<dynamic> _getEvents(DateTime date) {
  // Filter appointments for the selected date
  List<BookingModel> eventsForDate = _appointments
    .where((appointment) =>
      appointment.dateTime.year == date.year &&
      appointment.dateTime.month == date.month &&
      appointment.dateTime.day == date.day)
    .toList();

  // Return list of events for the selected date
  return eventsForDate;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        leading: IconButton(
          onPressed: () {
            //Navigator.push(context,
                //MaterialPageRoute(builder: (context) => const HomePage()));
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.orange[100],
            height: 150,
            child:TableCalendar.TableCalendar(
              

              
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              eventLoader: _getEvents,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (date) => _selectedDates.contains(date),
              onDaySelected: (selectedDate, focusedDate) {
                setState(() {
                  _selectedDates = [selectedDate];
                });
              },
            ),
            ),
            SizedBox(height: 20),
            _buildUpcomingEventsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingEventsList() {
    // Filter appointments for upcoming events
    List<BookingModel> upcomingEvents = _appointments
        .where((appointment) => appointment.dateTime.isAfter(DateTime.now()))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Upcoming Events',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: upcomingEvents.length,
          itemBuilder: (context, index) {
            BookingModel event = upcomingEvents[index];
            return ListTile(
              title: Text(event.userName),
              subtitle: Text(event.dateTime.toString()),
            );
          },
        ),
      ],
    );
  }
}
