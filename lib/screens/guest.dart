import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:myapp/screens/Cameraa.dart';
import 'package:myapp/screens/Commonservice.dart';
import 'package:myapp/screens/Service/User.dart';
import 'package:myapp/screens/UserModel.dart';
import 'package:myapp/screens/guest/Qrcode.dart';
import 'package:myapp/screens/guest/Scandoc.dart';
import 'package:myapp/screens/guest/Uploadscreen.dart';
import 'package:myapp/screens/guest/auth.dart';
import 'package:myapp/screens/guest/home.dart';
import 'package:myapp/screens/guest/logout.dart';
import 'package:myapp/screens/guest/term.dart';

class Guest extends StatefulWidget {
  final List<CameraDescription> cameraa;
  const Guest({Key? key, required this.cameraa}) : super(key: key);
  @override
  State<Guest> createState() => _GuestState();
}

class _GuestState extends State<Guest> {
  UserService userService = UserService();
  Commonservice commonservice = Commonservice();
  String email = '';
  String mdp = '';
  final List<Widget> _widget = [];
  int index = 0;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    commonservice.term.then(((terms) => setState(() => _widget.addAll([
          Home(
              onChangedStep: (indexx, value) => setState(() {
                    index = indexx;
                    email = value;
                  })),
          Term(
              terms: terms,
              onChangedStep: (indexx) => setState(() => index = indexx)),
          Auth(
              onChangedStep: (indexx, value) => setState(() {
                    index = indexx;
                    mdp = value;
                    userService.Auth(
                            Usermodel(uid: "0", email: email, pwd: mdp))
                        // ignore: avoid_print
                        .then((value) => print(value.toJson()));
                  })),
          LogoutScreen(
              onChangedStep: (indexx) => setState(() => index = indexx)),
          Qrcode(onChangedStep: (indexx) => setState(() => index = indexx)),
          CameraScreen(
            onChangedStep: (indexx) => setState(() => index = indexx),
            cameraaa: widget.cameraa,
          ),
          Upload(
            onChangedStep: (indexx) => setState(() => index = indexx),
          ),
          OCRPage(onChangedStep: (indexx) => setState(() => index = indexx)),
        ]))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widget.length == 0
          ? SafeArea(
              child: Scaffold(
              body: Center(child: Text("Loading")),
            ))
          : _widget.elementAt(index),
    );
  }
}
