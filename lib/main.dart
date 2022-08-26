import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/guest.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/screens/guest/auth.dart';
import 'package:myapp/screens/guest/home.dart';
import 'package:myapp/screens/guest/term.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Guest());
  }
}
