import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter01/pages/wordpage/word_page.dart';
import '../pages/details_page.dart';

Handler detailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String goodsId = params['id'].first;
  print('index>details goodsId is ${goodsId}');
  return DetailsPage(goodsId);
});

Handler wordDetailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String word = params['word'].first;
  print('index>details word is ${word}');
  return WordPage(word);
});
