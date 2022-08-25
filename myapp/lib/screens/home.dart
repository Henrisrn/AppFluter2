import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
      return SafeArea(
        child :Scaffold(
        appBar: AppBar(
          title: Center(
            child:Text("Titre application")
            ),
        ),
        body:Container(
          child: Center(
            child:Text("Coucou"),
          ),
          color: Colors.white,
        )
      )
    );
  }
}