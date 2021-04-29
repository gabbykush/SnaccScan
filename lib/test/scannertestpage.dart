import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class ScannerTestPage extends StatefulWidget {
  @override
  _ScannerTestPageState createState() => _ScannerTestPageState();
}

class _ScannerTestPageState extends State<ScannerTestPage> {
  ScanResult upc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          child: Column(
            children: [
              Text(upc.rawContent ?? 'Click Scan'),
              ElevatedButton(
                  onPressed: () async {
                    upc = await BarcodeScanner.scan();
                    setState(() {});
                  },
                  child: Text('scan'))
            ],
          ),
        ),
      ),
    );
  }
}
