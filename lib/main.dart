import 'package:flutter/material.dart';
import 'package:myapp/screens/guest.dart';
import 'package:myapp/screens/guest/auth.dart';
import 'package:myapp/screens/guest/home.dart';
import 'package:myapp/screens/guest/term.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Guest());
  }
}
