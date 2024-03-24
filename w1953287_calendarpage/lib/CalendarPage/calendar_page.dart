import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart' as TableCalendar;
import 'package:w1953287_calendarpage/model/booking_model.dart';
import 'package:w1953287_calendarpage/model/counselor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
  late CounselorModel counselorModel;
  late String fname;

  late TableCalendar.CalendarFormat _calendarFormat;
  late List<DateTime> _selectedDates = [];
  late List<BookingModel> _appointments;
  late FirebaseFirestore _db;
  late DateTime _selectedDate; // Define _selectedDate variable here

  @override
  void initState() {
    super.initState();
    _calendarFormat = TableCalendar.CalendarFormat.week;
    _appointments = [];
    _db = FirebaseFirestore.instance;
    _selectedDate = DateTime.now(); // Initialize with current date
    getUserName();
    _loadAppointments();
  }

void getUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userDoc = await FirebaseFirestore.instance
          .collection('Appointments')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        final fName = userDoc.data()?['FirstName'];
        setState(() {
          fname = fName ?? '';
        });
      }
    }
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

//  void _loadAppointments() {
//   // Assuming you have a variable named 'userId' that represents the current user's ID
//   String userId = 'your_user_id_here'; // Replace 'your_user_id_here' with actual user ID

//   _db.collection('Appointments')
//       .where('userId', isEqualTo: userId) // Filter by userId
//       .get()
//       .then((querySnapshot) {
//     setState(() {
//       _appointments = querySnapshot.docs
//           .map((doc) => BookingModel.fromSnapshot(doc))
//           .toList();
//     });
//   });
// }
  List<dynamic> _getEvents(DateTime date) {
  // Filter appointments for the selected date
  List<BookingModel> eventsForDate = _appointments
      .where((appointment) =>
          appointment.dateTime.year == date.year &&
          appointment.dateTime.month == date.month &&
          appointment.dateTime.day == date.day &&
          appointment.dateTime.isAfter(DateTime.now()))

      .toList();

  // Return a single event marker if there are multiple appointments, otherwise return the list of events
  return eventsForDate.isNotEmpty ? [eventsForDate.first] : [];
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
  title: Text(
    'Calendar',
    style: TextStyle(
      color: Colors.orange[600],
      fontWeight: FontWeight.bold,
    ),
  ),
  leading: IconButton(
    onPressed: () {
      Navigator.pop(context);
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
              color: Colors.orange[200],
              height: 400,
             child: TableCalendar.TableCalendar(
  calendarFormat: TableCalendar.CalendarFormat.month, // Display the whole month
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
      _selectedDate = selectedDate;
      _selectedDates = [selectedDate];
      // Load appointments for the selected date
      _loadAppointments();
    });
  },
  calendarStyle: TableCalendar.CalendarStyle(
    selectedDecoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.brown, // Change color here
    ),
    todayDecoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.brown[300], // Change current date color here
    ),
  ),
),

            ),
            SizedBox(height: 20),
            _buildUpcomingEventsList(_selectedDate),
          ],
        ),
      ),
    );
  }

  Widget _buildUpcomingEventsList(DateTime selectedDate) {
  // Filter appointments for upcoming events on the selected date
  List<BookingModel> eventsForSelectedDate = _appointments
      .where((appointment) =>
          appointment.dateTime.year == selectedDate.year &&
          appointment.dateTime.month == selectedDate.month &&
          appointment.dateTime.day == selectedDate.day &&
          appointment.dateTime.isAfter(DateTime.now()))
      .toList();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Text(
            'Upcoming Events',
            style: TextStyle(
              color: Colors.orange[600],
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
      SizedBox(height: 10),
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: eventsForSelectedDate.length,
        itemBuilder: (context, index) {
          BookingModel event = eventsForSelectedDate[index];
          return Container(
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.orange[100], // Set the background color here
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Counselor: ${event.counselor.name}', // Display counselor's name here
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'User: ${event.userName}',
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 5),
                    Text(
                      DateFormat.yMMMd().format(event.dateTime), // Display date
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.access_time),
                    SizedBox(width: 5),
                    Text(
                      DateFormat.jm().format(event.dateTime), // Display time
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    ],
  );
}
}