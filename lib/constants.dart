import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_test/checkDailyQuota.dart';

CallManager callManager = CallManager();
final FirebaseFirestore database = FirebaseFirestore.instance;

getData(String fieldName) async {
  final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
      await database.collection("myusers").doc("L2EaJXjW1SBOuvUm8hPx").get();
  var value = documentSnapshot.data()![fieldName];
  return value;
}
