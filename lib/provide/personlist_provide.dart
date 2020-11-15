import 'package:flutter/material.dart';
import 'package:flutter01/Tools/sqliteHelper.dart';
import '../models/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class PersonListProvide with ChangeNotifier {
  List<Person> personList = [];
  int listCount = 0;

  void changeList(Person p) async {
    int row = await DbHelper.dbHelper.addPersonToDatabase(p);
    getPersonList();
  }

  void getPersonList() async {
    personList = await DbHelper.dbHelper.getAllPersons();
    personList = personList.reversed.toList();
    listCount = personList.length;
    notifyListeners();
  }

  void delPersonById(int id) async {
    await DbHelper.dbHelper.deletePersonWithId(id);
    getPersonList();
  }
}
