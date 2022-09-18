import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/pages/addresses_page.dart';
import 'package:qr_reader/pages/maps_page.dart';
import 'package:qr_reader/provider/db_provider.dart';
import 'package:qr_reader/provider/scan_list_provider.dart';
import 'package:qr_reader/provider/ui_provider.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Escanear QR"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: ()async{
              final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
              final selectedType = scanListProvider.selectedType;
              await scanListProvider.deleteScanByType(selectedType);
            } 
          )
        ],
      ),
      body: const HomeBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const ScanButton(),
      
      bottomNavigationBar: const CustomNavigationBar()
    );
  }
}


class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    final scanListProvider = Provider.of<ScanListProvider>(context);
    // db.delete();
    int currentIndex = uiProvider.curretIndex;

    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return const MapsPage();
      case 1:
        scanListProvider.loadScansByType('http');
        return const AddressesPage();
      default:
        return Container();
    }
  }
}