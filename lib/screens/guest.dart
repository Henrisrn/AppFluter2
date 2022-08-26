import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/screens/guest/auth.dart';
import 'package:myapp/screens/guest/home.dart';
import 'package:myapp/screens/guest/term.dart';

class Guest extends StatefulWidget {
  const Guest({Key? key}) : super(key: key);

  @override
  State<Guest> createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  List<Widget> _widget = [];
  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _widget.addAll([
      Home(onChangedStep: (indexx) => setState(() => index = indexx)),
      Term(onChangedStep: (indexx) => setState(() => index = indexx)),
      Auth(onChangedStep: (indexx) => setState(() => index = indexx)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widget.elementAt(index),
    );
  }
}
