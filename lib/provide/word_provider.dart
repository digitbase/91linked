import 'package:flutter/material.dart';
import 'package:flutter01/element/lib_element.dart';
import 'package:flutter01/models/words.dart';
import '../service/service_method.dart';
import 'dart:convert';

class WordsProvide with ChangeNotifier {
  Words words = new Words(data: []);
  String initWord = '';
  String res = '';
  Words wordSearch = null;

  Future getWordInfo(String word) async {
    initWord = word;
    var formData = {'word': word, 'ex': 0};
    await request(
      url: 'searchwordByword',
      data: formData,
      method: 'get',
    ).then((value) {
      var responseData = jsonDecode(value.toString());
      words = Words.fromJson(responseData);
      notifyListeners();
    });
  }

  Future getWordListByFirst(String word) async {
    initWord = word;
    var formData = {'word': word, 'ex': 3};
    await request(
      url: 'searchwordList',
      data: formData,
      method: 'get',
    ).then((value) {
      var responseData = jsonDecode(value.toString());
      initWord = word;
      res = responseData.toString();
      wordSearch = Words.fromJson(responseData);
      print(wordSearch.data);

      notifyListeners();
    });
  }
}
