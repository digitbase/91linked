import 'package:flutter/material.dart';
import 'package:flutter01/Tools/sqliteHelper.dart';
import '../models/details.dart';
import '../service/service_method.dart';
import 'dart:convert';

class PersonListProvide with ChangeNotifier {
  List<Person> personList = [];
  int listCount = 0;

  void changeList(Person p) {
    personList.add(p);
    listCount = personList.length;
    notifyListeners();
  }

  void getPersonList() async {
    personList = await DbHelper.dbHelper.getAllPersons();
    listCount = personList.length;
    notifyListeners();
  }

  void delPersonById(int id) async {
    await DbHelper.dbHelper.deletePersonWithId(id);
    personList = await DbHelper.dbHelper.getAllPersons();
    listCount = personList.length;
    notifyListeners();
  }
}
