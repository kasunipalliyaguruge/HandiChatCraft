import 'package:cloud_firestore/cloud_firestore.dart';

class CounselorModel {
  late String name;
  late String specialize;
  late String about;
  late int catId;
  late String? counselorId;
  late String counselorEmail;
  late bool isMale;

  CounselorModel(this.name, this.specialize, this.about, this.catId,
      this.counselorId, this.counselorEmail,this.isMale);

  factory CounselorModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return CounselorModel(data?['name'], data?['specialized'], data?['about'],
        data?['catId'], data?['counselorId'], data?['counselorEmail'],data?['isMale']);
  }
}
