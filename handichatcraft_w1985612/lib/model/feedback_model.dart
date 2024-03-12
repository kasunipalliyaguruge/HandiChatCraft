import 'package:cloud_firestore/cloud_firestore.dart';

class FeedbackModel {
  late String clientName;
  late double rating;
  late String feedback;

  FeedbackModel(this.clientName, this.rating, this.feedback);

  factory FeedbackModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return FeedbackModel(
        data?['clientName'], data?['rating'], data?['feedback']);
  }
}
