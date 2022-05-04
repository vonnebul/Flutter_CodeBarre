import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
void main() {
  runApp(const MaterialApp(
    home: CodeBar(),
  ));
}

class CodeBar extends StatefulWidget {
  const CodeBar({ Key? key }) : super(key: key);

  @override
  State<CodeBar> createState() => _CodeBarState();
}

class _CodeBarState extends State<CodeBar> {
  String data="rien scanner";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CodeBarre"),),
      body: Column(children: [
        ElevatedButton(onPressed: () async{
          await FlutterBarcodeScanner.scanBarcode("#AAAAAA", "annuler le scan", true, ScanMode.QR)
          .then((value) => setState(()=> data = value));
        }, child: const Text("cliquez pour scanner")),
        SizedBox(
          height: 100,
        ),
        Text(data)
      ]),
    );
  }
}