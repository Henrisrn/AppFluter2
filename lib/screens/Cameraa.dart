import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' show join;

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameraaa;
  const CameraScreen({Key? key, required this.cameraaa}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controler;
  String _lastImage = '';
  late Future<void> Initializecontroler;
  int _selectedCameraindex = 1;

  Future<void> InitCamera(CameraDescription camera) async {
    _controler = CameraController(camera, ResolutionPreset.medium);

    _controler.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    if (_controler.value.hasError) {
      print(_controler.value.errorDescription);
    }
    Initializecontroler = _controler.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  // ignore: use_function_type_syntax_for_parameters
  @override
  void dispose() {
    _controler.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Cameratooglea();
  }

  Future<void> _Takephoto() async {
    try {
      await Initializecontroler;
      print("Photo");
      String path = join((await getTemporaryDirectory()).path,
          "${DateTime.now().millisecondsSinceEpoch}.jpg");
      print(path);
      await _controler.takePicture();
      setState(() => _lastImage = path);
    } catch (e) {
      print("error");
      print(e);
    }
  }

  Future<void> Cameratooglea() async {
    if (_lastImage != '') {
      _lastImage = '';
    }

    setState(() {
      if (_selectedCameraindex > -1) {
        if (_selectedCameraindex == 0) {
          _selectedCameraindex = 1;
        } else {
          _selectedCameraindex = 0;
        }
      }
      ;
    });
    await InitCamera(widget.cameraaa[_selectedCameraindex]);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: _lastImage != null
            ? FlatButton(
                onPressed: () => setState(() => _lastImage = ''),
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              )
            : null,
      ),
      body: FutureBuilder(
        future: Initializecontroler,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                Transform.scale(
                    scale: _controler.value.aspectRatio / size.aspectRatio,
                    child: Center(
                        child: AspectRatio(
                      aspectRatio: _controler.value.aspectRatio,
                      child: _lastImage != ''
                          ? Image(
                              image: FileImage(
                                File(_lastImage),
                              ),
                            )
                          : CameraPreview(_controler),
                    ))),
                Positioned(
                  left: 55,
                  bottom: 10,
                  child: FloatingActionButton(
                    onPressed: (() => print("galerie")),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          child: Icon(Icons.photo_album_rounded),
                        ),
                      ),
                      margin: EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          color: Colors.transparent),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Positioned(
                  right: 55,
                  bottom: 10,
                  child: FloatingActionButton(
                    onPressed: (() => Cameratooglea()),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          child: Icon(Icons.loop),
                        ),
                      ),
                      margin: EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          color: Colors.transparent),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Positioned(
                  left: 160,
                  bottom: 10,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 10,
                        color: Colors.grey,
                      ),
                      color: Colors.transparent,
                    ),
                    child: FittedBox(
                      child: InkWell(
                        onLongPress: () => print("Take Vidéo"),
                        child: FloatingActionButton(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          onPressed: () => _Takephoto(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(
              child: Scaffold(
            body: Text("Loading"),
            backgroundColor: Colors.black,
          ));
        },
      ),
    ));
  }
}
