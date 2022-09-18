import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/widgets.dart';

class AddressesPage extends StatelessWidget {
  const AddressesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScanListTile(type: 'http');
  }
}