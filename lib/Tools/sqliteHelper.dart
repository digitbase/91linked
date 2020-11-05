import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter01/models/dog_model.dart';
import "package:sqflite/sqflite.dart";
import "package:path/path.dart";
import "dart:io";

class SqliteHepler {
  String _dbDir;
  String _dbName = 'myDick.db';

  Database _db;
  initDB() async {
    print('ddd');
    _dbDir = await getDatabasesPath();
    _db = await openDatabase(
      join(_dbDir, _dbName),
      onCreate: (db, version) {
        print('create Database');
        return db.execute(
          '''
          CREATE  dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)
        ''',
        );
      },
      version: 1,
    );
  }

  Future<void> insertDog(Dog dog) async {
    final Database db = await _db;

    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('insert a Dog');
  }
}

class DbHelper {
  DbHelper._();
  static final DbHelper dbHelper = DbHelper._();
  Future<Database> _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = getDatabaseInstance();
    return _database;
  }

  Future<Database> getDatabaseInstance() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, 'person.db');
    final Future<Database> database = openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE Person(id INTEGER PRIMARY KEY  , name TEXT , email TEXT ,carModel TEXT )");
    });
    return database;
  }

  Future<List<Person>> getAllPersons() async {
    final db = await database;
    var result = await db.query('Person');
    List<Person> list = result.map((e) => Person.fromMap(e)).toList();
    return list;
  }

  Future<Person> getPersonWithId(int id) async {
    final db = await database;
    var result = await db.query("Person", where: "id=?", whereArgs: [id]);
    return result.isEmpty ? Person.fromMap(result.first) : null;
  }

  Future<List<Person>> getPersonWithName(String name) async {
    final db = await database;
    var result = await db
        .query("Person", where: " name Like ? ", whereArgs: ['%$name%']);
    List<Person> list = new List<Person>();
    result.forEach((itemMap) {
      list.add(Person.fromMap(itemMap));
    });
    return list;
  }

  addPersonToDatabase(Person person) async {
    final db = await database;
    var raw = await db.insert(
      "Person",
      person.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print('$raw');

    return raw;
  }

  deletePersonWithId(int id) async {
    final db = await database;
    var result = db.delete("person", where: "id=?", whereArgs: [id]);
    print('delete $id');
    return result;
  }

  deleteAllPersons() async {
    final db = await database;
    db.delete("person");
  }

  updatePerson(Person person) async {
    final db = await database;
    var result = db.update("Person", person.toMap(),
        where: "id=?", whereArgs: [person.id]);
    print('$result');
    return result;
  }
}

class Person {
  int id;
  String name;
  String email;
  String carModel;

  Person({this.id, this.name, this.email, this.carModel});
  Person.withOutId({this.name, this.email, this.carModel});

  Map<String, dynamic> toMap() =>
      {'id': id, 'name': name, 'email': email, 'carModel': carModel};

  factory Person.fromMap(Map<String, dynamic> map) => Person(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      carModel: map['carModel']);
}
