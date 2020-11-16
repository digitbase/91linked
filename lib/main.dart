import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter01/models/dog_model.dart';
import 'package:flutter01/pages/lib_pages.dart';
import 'package:flutter01/pages/wordpage/wordhome_page.dart';
import 'package:flutter01/provide/personlist_provide.dart';
import 'package:flutter01/provide/word_provider.dart';
import 'package:flutter_html/style.dart';
import 'package:provide/provide.dart';
import 'Tools/sqliteHelper.dart';
import 'myapp2.dart';
import 'myapp3.dart';
import 'provide/cart_provider.dart';
import 'provide/counter.dart';
import 'element/r_log.dart';
import 'config/routers_cfg.dart';
import 'provide/child_category.dart';
import 'provide/child_category_goods.dart';
import 'package:fluro/fluro.dart';
import './routers/routers.dart';
import './routers/application.dart';
import 'provide/gooddetail_pvd.dart';
import 'provide/details_info.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  var counter = Counter();
  var childCategory = ChildCategory();
  var childCategoryGoods = ChildCategoryGoods();
  var providers = Providers();
  var goodDetailPvd = GoodDetailProvide();
  var detailInfoProvide = DetailInfoProvide();
  var cartPrivde = CarProvide();
  var personListProvide = PersonListProvide();
  var wordsProvide = WordsProvide();

  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<GoodDetailProvide>.value(goodDetailPvd))
    ..provide(Provider<CarProvide>.value(cartPrivde))
    ..provide(Provider<WordsProvide>.value(wordsProvide))
    ..provide(Provider<PersonListProvide>.value(personListProvide))
    ..provide(Provider<DetailInfoProvide>.value(detailInfoProvide))
    ..provide(Provider<ChildCategoryGoods>.value(childCategoryGoods));

  runApp(ProviderNode(child: MyApp3(), providers: providers));
}

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WordHomePage(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routers.configRouters(router);
    Application.router = router;

    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Application.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      routes: staticRoutes,
      initialRoute: "/",
    );
  }
}
