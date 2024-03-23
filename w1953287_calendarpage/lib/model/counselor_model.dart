import 'package:cloud_firestore/cloud_firestore.dart';

class CounselorModel {
  late String name;
  late String specialize;
  late String about;
  late int catId;

  CounselorModel(this.name, this.specialize, this.about, this.catId);

  factory CounselorModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return CounselorModel(
        data?['name'], data?['specialized'], data?['about'], data?['catId']);
  }
}
