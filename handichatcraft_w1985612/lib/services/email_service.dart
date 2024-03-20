import 'package:dio/dio.dart';

class EmailService {
  final Dio _dio = Dio();

  Future<void> sendEmail() async {
    const String url = 'https://api.postmarkapp.com/email';
    const String serverToken = '2331e1b2-2f94-475f-8e8e-24c625a3e710';

    final Map<String, dynamic> data = {
      'From': 'hansalagamage@gmail.com',
      'To': 'hansalagamage@gmail.com',
      'Subject': 'Postmark test',
      'TextBody': 'Hello dear Postmark user.',
      'HtmlBody':
          '<html><body><strong>Hello</strong> dear Postmark user.</body></html>',
      'MessageStream': 'outbound',
    };

    final Options options = Options(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Postmark-Server-Token': serverToken,
      },
    );

    try {
      final Response response =
          await _dio.post(url, data: FormData.fromMap(data), options: options);
      print(response.data);
    } catch (e) {
      print(e);
    }
  }
}
