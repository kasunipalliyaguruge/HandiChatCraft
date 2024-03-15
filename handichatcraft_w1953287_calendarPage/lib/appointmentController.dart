import 'package:get/get.dart';
import 'package:to_do/appointments.dart';
import 'package:to_do/db_helper.dart';

class AppointmentController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }
  var appointmentList = <Appointment>[].obs;
  Future<int> addAppointment({Appointment? appointment})async{
    return await DBHelper.insert(appointment);
  }
  void getAppointments() async {
    List<Map<String, dynamic>> appointments = await DBHelper.query();
    appointmentList.assignAll(appointments.map((data) => new Appointment.fromJson(data)).toList());
  }
void delete(Appointment appointment) {
   DBHelper.delete(appointment);
   getAppointments();
  
}
void markAppointmentCompleted(int id) async{
  await DBHelper.update(id);
  getAppointments();
}

}