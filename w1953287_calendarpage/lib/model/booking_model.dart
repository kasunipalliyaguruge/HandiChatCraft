import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:w1953287_calendarpage/model/counselor_model.dart';

class BookingModel {
  CounselorModel counselor;
  String userName;
  DateTime dateTime;

  BookingModel(this.counselor, this.userName, this.dateTime);

  factory BookingModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data();
    final counselorData = data?['counselor'];
    final counselorModel = counselorData != null ? CounselorModel.fromFirestore(counselorData) : CounselorModel('', '', '', 0); // Initialize counselor with default values if data is null
    return BookingModel(
      counselorModel,
      data?['userName'] ?? '',
      (data?['dateTime'] as Timestamp).toDate(),
    );
  }
  
}
