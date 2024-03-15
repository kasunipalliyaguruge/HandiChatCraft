import 'package:date_picker_timeline/date_picker_widget.dart';
//import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do/add_appointment_bar.dart';
import 'package:to_do/appointmentController.dart';
import 'package:to_do/appointmentTile.dart';
import 'package:to_do/appointments.dart';
import 'package:to_do/notification_services.dart';
import 'package:to_do/theme.dart';
import 'package:to_do/theme_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),


    );
  }
}
class MyButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const MyButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Container(
        width: 100,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.orangeAccent
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            
            
            color: Colors.white,
            
          ),
          textAlign: TextAlign.center,
        ),
      )

    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int _currentIndex = 3;

  DateTime _selectedDate = DateTime.now();
  final _appointmentController = Get.put(AppointmentController());
  var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper=NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
    setState(() {
      print("I'm here");
    });
    _showAppointments();

  }

  @override
  Widget build(BuildContext context) {
    print("build method called");
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: context.theme.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orangeAccent,
                  type: BottomNavigationBarType.fixed, // Set to fixed to display all items

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chatbot',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.white, // Change the color as needed
          unselectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      ),
      body: Column(
        children: [
          
          _addTaskBar(),
           _addDateBar(),
           SizedBox(height: 10,),
          _showAppointments(),
        ],
        
        ),
        
        );


  }
  

  _showAppointments() {
    return Expanded(
        child: Obx((){
          return ListView.builder(
            itemCount: _appointmentController.appointmentList.length,

            itemBuilder:(_, index) {
              Appointment appointment = _appointmentController.appointmentList[index];
              print(appointment.toJson());
              if(appointment.repeat=='Daily') {
                DateTime date = DateFormat.jm().parse(appointment.startTime.toString());
                var myTime = DateFormat("HH:mm").format(date);
                notifyHelper.scheduledNotification(
                  int.parse(myTime.toString().split(":")[0]),
                  int.parse(myTime.toString().split(":")[1]),
                  appointment
                );
                 return AnimationConfiguration.staggeredList(position: index, child: SlideAnimation(
                child: FadeInAnimation(
                  child: Row( 
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showBottomSheet(context, appointment);
                        },
                        child: AppointmentTile(appointment),
                      )

              ],)),));
              }
              if (appointment.date==DateFormat.yMd().format(_selectedDate)) {
                  return AnimationConfiguration.staggeredList(position: index, child: SlideAnimation(
                child: FadeInAnimation(
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _showBottomSheet(context, appointment);
                        },
                        child: AppointmentTile(appointment),
                      )

              ],)),));
              }else {
                return Container();

              }
            ;
            
          });
        })
    );


  }

  _addTaskBar(){
    return Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container( 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(DateFormat.yMMMMd().format(DateTime.now()),
                    style: subHeadingStyle,
                    ),
                      Text("Today",
                      style: headingStyle,
                      )
                  ],
                ),
              ),
              MyButton(label: "Schedule an Appointment", onTap: () async{
                await Get.to(() => AddAppointmentPage());
                _appointmentController.getAppointments();
                }
              )
            ],),
          );
  }
  _showBottomSheet(BuildContext context, Appointment appointment) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.only(top: 4),
        height: appointment.isCompleted==1?
        MediaQuery.of(context).size.height*0.24:
                MediaQuery.of(context).size.height*0.32,
                color: Get.isDarkMode?darkGreyClr:Colors.white,
                child: Column(children: [
                  Container(
                    height: 6,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Get.isDarkMode?Colors.grey[600]:Colors.grey[300]

                    ),
                  ),
                  Spacer(),
                  appointment.isCompleted==1
                  ?Container()
                  :_bottomSheetButton(
                    label: "Appointment Scheduled",
                    onTap: () {
                      _appointmentController.markAppointmentCompleted(appointment.id!);
                      Get.back();
                    },
                    clr:primaryClr,
                    context: context,
                  ),
                 
                  _bottomSheetButton(
                    label: "Delete Appointment",
                    onTap: () {
                      _appointmentController.delete(appointment);
                      Get.back();
                    },
                    clr:Colors.red[300]!,
                    context: context,
                  ),
                   SizedBox(
                    height: 20,
                  ),
                    _bottomSheetButton(
                    label: "Close",
                    onTap: () {
                      Get.back();
                    },
                    clr:Colors.red[300]!,
                    isClose: true,
                    context: context,
                  ),
                   SizedBox(
                    height: 10,
                  ),
                ]),

      ),
    );
  }
  _bottomSheetButton({
required String label,
required Function() onTap,
required Color clr,
bool isClose=false,
required BuildContext context,
  }) {
return GestureDetector(
  onTap:onTap,
  child: Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    height: 55,
    width: MediaQuery.of(context).size.width*0.9,
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color:isClose==true?Get.isDarkMode?Colors.grey[600]!:Colors.grey[300]!:clr
      ),
      borderRadius: BorderRadius.circular(20),
      color: isClose==true?Colors.transparent:clr,

    ),
    child: Center(
      child: Text(
        label,
        style: isClose?titleStyle: titleStyle.copyWith(color: Colors.white),
      ),
    ),
  ),
);
  }
_addDateBar() {
  return Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width:80,
              initialSelectedDate: DateTime.now(),
              selectionColor: Colors.orangeAccent,
              selectedTextColor: Colors.white,
              dateTextStyle:  GoogleFonts.lato(
                textStyle:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.grey
                ),
              ),
              dayTextStyle:  GoogleFonts.lato(
                textStyle:TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey
                ),
              ),
              monthTextStyle:  GoogleFonts.lato(
                textStyle:TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey
                ),
              ),
              
              onDateChange: (date) {
                setState(() {
                  _selectedDate=date;

                });
              },
              
            ),
          );
}
  _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: (){
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode?"Activate Light Theme": "Activate Dark Theme"
          );
          notifyHelper.scheduledNotification();


        },
        child: Icon(Get.isDarkMode ?Icons.wb_sunny_outlined:Icons.nightlight_round,
        size: 20,
        color:Get.isDarkMode ? Colors.white:Colors.black
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage(
            "images/user.png"
          ),
        ),
        
         SizedBox(width: 20,),
      ],
    );

  }
  
}