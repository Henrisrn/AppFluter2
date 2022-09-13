import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Upload extends StatefulWidget {
  final Function(int) onChangedStep;
  const Upload({super.key, required this.onChangedStep});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  PlatformFile? platformFile;
  final storage = FirebaseStorage.instance;
  Future upload() async {
    final path = 'files/${platformFile}';
    // ignore: unused_local_variable
    final a = File(platformFile!.path!);
    final ref = storage.ref().child(path);
    UploadTask aa = ref.putFile(a);
  }

  Future download() async {
    final res = await FilePicker.platform.pickFiles();
    if (res == null) return;
    setState(() {
      platformFile = res.files.first;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Envoie de Fichier sur Firebase")),
        backgroundColor: Colors.grey,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => (widget.onChangedStep(4)),
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          if (platformFile != null)
            Expanded(
              child: Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(platformFile!.path!),
                  )),
            ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(onPressed: download, child: Text("Download File")),
          ElevatedButton(onPressed: upload, child: Text("Upload File")),
        ],
      ),
    );
  }
}
