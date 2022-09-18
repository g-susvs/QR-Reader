import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/scan_model.dart';

class DBProvider{
  static Database? _database;

  static final DBProvider db = DBProvider._private(); // guarda la instancia del contructor privado
  DBProvider._private();

  Future<Database?> get database async {
    if(_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }
  Future<Database> initDB() async {
    // Path de donde se almacena la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path,'scansDB.db');
    // Crear DB
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db){},
      onCreate: (Database db, int version) async{
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            type TEXT,
            value TEXT
          )
        ''');
      }
    );
  }
  

  Future<int>insertScan(ScanModel newScan) async {
    final db = await database;
    final res =  db!.insert('Scans', newScan.toMap());
    return res;
  }

  Future<ScanModel?> getScanById(int id) async{
    final db = await database;
    final res = await db!.query('Scans', where: 'id = ?',whereArgs: [id]);
    return res.isNotEmpty ? ScanModel.fromMap(res.first):null;
  }
  Future<List<ScanModel>?> getAllScans() async{
    final db = await database;
    final res = await db!.query('Scans');
    return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList():[];
  }
  Future<List<ScanModel>?> getScanByType(String type) async{
    final db = await database;
    final res = await db!.query('Scans', where: 'type = ?',whereArgs: [type]);
    return res.isNotEmpty ? res.map((s) => ScanModel.fromMap(s)).toList():[];
  }

  Future<int> updateScan(ScanModel scan) async {
    final db = await database;
    final res = await db!.update('Scans',scan.toMap(),where: 'id = ?',whereArgs: [scan.id]);
    return res;
  }
  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db!.delete('Scans',where: 'id = ?',whereArgs: [id]);
    return res;
  }
  Future<int> deleteByType(String type) async{
    final db = await database;
    final res = db!.delete("Scans",where: "type = ?", whereArgs: [type]);
    return res;
  }
}