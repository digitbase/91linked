import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routers {
  static String root = '/';
  static String detailsPage = '/detail';
  static String wordPage = '/word';

  static void configRouters(FluroRouter router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ERROR===>router was not found!!');
    });

    router.define(detailsPage, handler: detailsHandler);
    router.define(wordPage, handler: wordDetailsHandler);
  }
}
