import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/widgets.dart';

class MapsPage extends StatelessWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanListTile(type: 'geo');
  }
}