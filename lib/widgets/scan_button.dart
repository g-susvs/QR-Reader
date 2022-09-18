import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/helpers/url_launcher.dart';
import 'package:qr_reader/provider/scan_list_provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.qr_code),
        onPressed: ()async{
          final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode("#ff6666","Cancelar",false,ScanMode.BARCODE);
          if(barcodeScanRes == "-1") return;
          // String barcodeScanRes = 'https://github.com/g-susvs';
          // String barcodeScanRes = 'geo:-12.292740,-76.852634';
          
          final scanRes = await scanListProvider.newScan(barcodeScanRes);
          urlLauncher(context, scanRes);
        }
      );
  }
}