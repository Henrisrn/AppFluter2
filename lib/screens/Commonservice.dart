import 'package:cloud_firestore/cloud_firestore.dart';

class Commonservice {
  final FirebaseFirestore _auuu = FirebaseFirestore.instance;
  Future<String> get term async {
    await Future.delayed(Duration(seconds: 2));
    DocumentReference res = _auuu.collection("Scan").doc("Photo");
    await FirebaseFirestore.instance.disableNetwork();
    await FirebaseFirestore.instance.enableNetwork();
    //String aa = (await res.get()).get("content");
    String aa = "Ceci est un remplacement à la panne réseau du téléphone";
    return aa;
  }
}
