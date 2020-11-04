import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:sqflite/sqflite.dart";
import "package:path/path.dart" as p;
import "dart:io";

class SqliteHepler {
  String _dbDir;
  String _dbName = 'myDick.db';

  Database _db;
  initDB() async {
    _dbDir = await getDatabasesPath();
    _db = await openDatabase(
      p.join(_dbDir, _dbName),
      onCreate: (db, version) {
        return db.execute(
          '''

        ''',
        );
      },
      version: 1,
    );
  }
}

class DbHelp {
  static final String tname = 'Dicitonry';

  static Database dbExists;

  Future<Database> get db async {
    if (dbExists != null) {
      print('dbstatus exists');
      return dbExists;
    } else {
      dbExists = await InitDb();
      return dbExists;
    }
  }

  Future InitDb() async {
    final dbPath = await getDatabasesPath();

    print('path + ${dbPath}');
    final path = p.join('assets', 'dictionary.db');

    final exist = await databaseExists(path);

    if (!exist) {
      print('dbstatus Createing new from assets');

      try {
        await Directory(p.dirname(path)).create(recursive: true);
      } catch (e) {}

      ByteData data = await rootBundle.load(p.join('assets', 'dictionary.db'));
      List<int> byte =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(byte, flush: true);
    } else {
      print('dbsatus Opening database');
    }

    return await openDatabase(path);
  }
}
