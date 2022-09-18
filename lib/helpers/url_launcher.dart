import 'package:flutter/cupertino.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

urlLauncher(BuildContext context, ScanModel scan)async {
  final Uri url = Uri.parse(scan.value);
  if(scan.type == 'http'){
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }else{
    Navigator.pushNamed(context, 'map', arguments: scan);
  }
}