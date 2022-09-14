import 'dart:io';

//import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

class OCRPage extends StatefulWidget {
  final Function(int) onChangedStep;
  const OCRPage({super.key, required this.onChangedStep});

  @override
  State<OCRPage> createState() => _OCRPageState();
}

class _OCRPageState extends State<OCRPage> {
  @override
  String result = "";
  File? image;
  InputImage? inputImage;
  ImagePicker? imagePicker;

  /*pickImageFromGallery() async {
    PickedFile? pickedFile =
        await imagePicker!.getImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    setState(() {
      image;
      imageToText(image);
    });
  }

  pickImageFromCamera() async {
    PickedFile? pickedFile =
        await imagePicker!.getImage(source: ImageSource.camera);
    image = File(pickedFile!.path);
    setState(() {
      image;
      imageToText(image);
    });
  }*/
  Future pickImageFromGallery() async {
    final pickedFile = await imagePicker!.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        inputImage = InputImage.fromFilePath(pickedFile.path);
        imageToText(inputImage);
      } else {
        print('No image selected.');
      }
    });
  }

  Future captureImageFromCamera() async {
    final pickedFile = await imagePicker!.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
        inputImage = InputImage.fromFilePath(pickedFile.path);
        imageToText(inputImage);
      } else {
        print('No image selected.');
      }
    });
  }

  Future imageToText(inputImage) async {
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    String text = recognizedText.text;
    print(text);
    for (TextBlock block in recognizedText.blocks) {
      final List<Offset> cornerPoints = block.cornerPoints.cast<Offset>();
      final String text = block.text;
      final List<String> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
          result += element.text + " ";
        }
      }
      print(result);
    }
    textRecognizer.close();
/*
    result = '';
    print("Ca passe" + result);
    final textDetector = GoogleMlKit.vision.textDetector();
    sleep(Duration(seconds: 8));
    print("Ca passe" + result);
    final RecognisedText recognisedText =
        await textDetector.processImage(inputImage);
    sleep(Duration(seconds: 8));
    print("Ca passe" + result);

    setState(() {
      String text = recognisedText.text;
      for (TextBlock block in recognisedText.blocks) {
        print("Ca passe" + result);
        //each block of text/section of text
        final String text = block.text;
        print("Ca passe" + result);
        print("block of text: ");
        print(text);
        for (TextLine line in block.lines) {
          //each line within a text block
          print("Ca passe" + result);
          for (TextElement element in line.elements) {
            print("Ca passe" + result);
            //each word within a line
            result += element.text + " ";
          }
        }
      }
      result += "\n\n";
    });*/
  }
  /*prefereImageLabeling() async {
    final FirebaseVisionImage firebaseVisionImage =
        FirebaseVisionImage.fromFile(image!);
    final TextRecognizer recognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await recognizer.processImage(firebaseVisionImage);
    result = "";
    setState(() {
      for (TextBlock block in visionText.blocks) {
        final String txt = block.text!;
        for (TextLine line in block.lines) {
          for (TextElement element in line.elements) {
            result += element.text! + " ";
          }
        }
        result += "\n\n";
      }
    });
  }*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    imagePicker = ImagePicker();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(result),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => (widget.onChangedStep(3)),
          color: Colors.black,
        ),
      ),
      body: Column(children: [
        SizedBox(
          height: 50,
        ),
        Container(
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              result,
              textAlign: TextAlign.justify,
            ),
          )),
        ),
        Container(
          child: Stack(children: [
            Center(
              child: TextButton(
                onPressed: () {
                  Future a = pickImageFromGallery();
                },
                onLongPress: () {
                  Future a = captureImageFromCamera();
                },
                child: Container(
                  child: image != null
                      ? Image.file(
                          image!,
                          width: 140,
                          height: 192,
                        )
                      : Container(
                          child: Icon(
                            Icons.camera_alt_rounded,
                            size: 100,
                            color: Colors.grey,
                          ),
                        ),
                ),
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
