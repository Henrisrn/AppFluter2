import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LogoutScreen extends StatefulWidget {
  final Function(int) onChangedStep;

  LogoutScreen({Key? key, required this.onChangedStep}) : super(key: key);

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Center(
          child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  RaisedButton(
                    onPressed: () => ({widget.onChangedStep(0)}),
                    color: Colors.grey,
                    child: Text("logout"),
                  )
                ],
              ))),
    ));
  }
}
