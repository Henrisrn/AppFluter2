import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Auth extends StatefulWidget {
  final Function(int) onChangedStep;

  Auth({Key? key, required this.onChangedStep}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String _pwd = '';
  bool issecret = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Center(child: Text("")),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => (widget.onChangedStep(1)),
          color: Colors.black,
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: "Pasword \n".toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                children: [],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      onChanged: (value) => setState(() => _pwd = value),
                      obscureText: issecret,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () => setState(() => issecret = !issecret),
                            child: Icon(!issecret
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        hintText: "Pasword",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: BorderSide(
                              color: Colors.grey,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ]),
            ),
            Center(
              child: RaisedButton(
                onPressed: _pwd.length < 6
                    ? null
                    : () => {widget.onChangedStep(3), print(_pwd)},
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Center(
                  child: Text(
                    "Continue".toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      backgroundColor: Colors.white,
    ));
  }
}
