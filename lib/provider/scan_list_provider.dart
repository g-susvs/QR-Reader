import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/provider/db_provider.dart';

class ScanListProvider extends ChangeNotifier{
  List<ScanModel> scans = [];
  String selectedType = 'http';

  Future<ScanModel> newScan(String value)async{
    
    final ScanModel scan = ScanModel(value: value);
    final id = await DBProvider.db.insertScan(scan);
    scan.id = id;
    if(selectedType == scan.type){
      scans.add(scan);
      notifyListeners();
    }
    return scan;
  }

  loadScans()async{
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...scans!];
    notifyListeners();
  }

  loadScansByType(String type)async{
    final scans = await DBProvider.db.getScanByType(type);
    this.scans = [...scans!];
    selectedType = type;
    notifyListeners();
  }
  deleteScanById(int id)async{
    scans.removeWhere((scan) => scan.id == id);
    await DBProvider.db.deleteScan(id);
    loadScansByType(selectedType);

  }
  deleteScanByType(String type)async{
    await DBProvider.db.deleteByType(type);
    notifyListeners();

  }

}