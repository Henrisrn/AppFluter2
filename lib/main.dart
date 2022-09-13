import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myapp/screens/Cameraa.dart';
import 'package:myapp/screens/guest.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:myapp/screens/guest/auth.dart';
import 'package:myapp/screens/guest/home.dart';
import 'package:myapp/screens/guest/term.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final List<CameraDescription> cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Guest(
        cameraa: cameras,
      ),
    );
  }
}
