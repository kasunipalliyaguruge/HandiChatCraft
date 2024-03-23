import 'package:emailjs/emailjs.dart';
import 'package:handichatcraft_w1985612/model/booking_model.dart';
import 'package:handichatcraft_w1985612/model/counselor_model.dart';

class EmailService {
  Future<void> sendEmail(BookingModel booking, CounselorModel counselor) async {
    Map<String, dynamic> templateParams = {
      'to': counselor.counselorEmail,
      'message':
          'You have an appointment with ${booking.userName} at ${booking.dateTime.toString()} email address is ${booking.email}'
    };

    try {
      await EmailJS.send(
        'service_t89uz0h',
        'template_ggpddro',
        templateParams,
        const Options(
          publicKey: 'Rj6zE83jJ3X6NZtxa',
          privateKey: 'Q17nPqexz2btoR7yfcAyP',
        ),
      );
      print('SUCCESS!');
    } catch (error) {
      print(error.toString());
    }
  }
}
