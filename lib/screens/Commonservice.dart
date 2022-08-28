import 'package:cloud_firestore/cloud_firestore.dart';

class Commonservice {
  final FirebaseFirestore _auuu = FirebaseFirestore.instance;
  Future<String> get term async {
    await Future.delayed(Duration(seconds: 5));
    DocumentReference res = _auuu.collection("Scan").doc("Photo");
    String aa = (await res.get()).get("content");

    return aa;
  }
}
