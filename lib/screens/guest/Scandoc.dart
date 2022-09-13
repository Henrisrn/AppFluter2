import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';

class OCRPage extends StatefulWidget {
  @override
  final Function(int) onChangedStep;
  const OCRPage({super.key, required this.onChangedStep});
  _OCRPage createState() => _OCRPage();
}

class _OCRPage extends State<OCRPage> {
  int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  String _textValue = "sample";

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.lime,
        buttonColor: Colors.lime,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
            ),
            onPressed: () => (widget.onChangedStep(4)),
            color: Colors.black,
          ),
          title: new Text('Flutter Mobile Vision'),
        ),
        body: Center(
            child: new ListView(
          children: <Widget>[
            new Text(_textValue),
            new ElevatedButton(
              onPressed: _read,
              child: new Text('Start Scanning'),
            ),
          ],
        )),
      ),
    );
  }

  Future<Null> _read() async {
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        camera: _cameraOcr,
        waitTap: true,
      );

      setState(() {
        _textValue = texts[0].value;
      });
    } on Exception {
      texts.add(new OcrText('Failed to recognize text.'));
    }
  }
}
