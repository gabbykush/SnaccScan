import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

Future<String> scanBarcode() async {
  String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#FF0000', 'Cancel', false, ScanMode.BARCODE);

  return barcodeScanRes;
}
