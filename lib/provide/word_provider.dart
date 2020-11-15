import 'package:flutter/material.dart';
import 'package:flutter01/models/words.dart';
import '../service/service_method.dart';
import 'dart:convert';

class WordsProvide with ChangeNotifier {
  Words words = null;

  Future getWordInfo(String word) async {
    var formData = {'word': word, 'ex': 0};
    await request(
      url: 'searchwordByword',
      data: formData,
      method: 'get',
    ).then((value) {
      var responseData = jsonDecode(value.toString());

      print(responseData);

      words = Words.fromJson(responseData);

      notifyListeners();
    });
  }
}
