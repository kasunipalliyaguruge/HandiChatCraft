import 'package:flutter/material.dart';
import 'package:handichatcraft_w1985612/model/booking_model.dart';
import 'package:handichatcraft_w1985612/model/counselor_model.dart';
import 'package:handichatcraft_w1985612/pages/booking_confirmed_page.dart';
import 'package:handichatcraft_w1985612/pages/counselor_page.dart';
import 'package:handichatcraft_w1985612/pages/counselor_profiles.dart';
import 'package:handichatcraft_w1985612/pages/schedule_page.dart';

class AccountNavigator extends StatelessWidget {
  const AccountNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: '/',
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (context) => CounselorPage();
              break;

            case '/counselorProfile':
              final CounselorModel counselorModel =
                  settings.arguments as CounselorModel;
              builder =
                  (context) => CounselorProfile(counselorModel: counselorModel);
              break;

            case '/schedulePage':
              final CounselorModel counselorModel =
                  settings.arguments as CounselorModel;
              builder = (context) => SchedulePage(counselor: counselorModel);
              break;

            case '/bookingConfirmation':
              final BookingModel bookingModel =
                  settings.arguments as BookingModel;
              builder = (context) =>
                  BookingConfirmedpage(appointmentDetails: bookingModel);
              break;

            case '/ratingPage':
              final BookingModel bookingModel =
                  settings.arguments as BookingModel;
              builder = (context) =>
                  BookingConfirmedpage(appointmentDetails: bookingModel);
              break;

            case '/feedbackPage':
              final BookingModel bookingModel =
                  settings.arguments as BookingModel;
              builder = (context) =>
                  BookingConfirmedpage(appointmentDetails: bookingModel);
              break;

            default:
              throw Exception('Invalid Route');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        });
  }
}
