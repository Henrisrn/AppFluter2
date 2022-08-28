import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Qrcode extends StatefulWidget {
  final Function(int) onChangedStep;
  const Qrcode({Key? key, required this.onChangedStep}) : super(key: key);

  @override
  State<Qrcode> createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  @override
  String _data = "";
  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("")),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => (widget.onChangedStep(3)),
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          FlatButton(onPressed: () async => _scan(), child: Text("Scan Button"))
        ],
      ),
    );
  }
}
