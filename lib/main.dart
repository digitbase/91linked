import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter01/models/dog_model.dart';
import 'package:flutter01/pages/lib_pages.dart';
import 'package:flutter01/provide/personlist_provide.dart';
import 'package:flutter_html/style.dart';
import 'package:provide/provide.dart';
import 'Tools/sqliteHelper.dart';
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

  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(Provider<GoodDetailProvide>.value(goodDetailPvd))
    ..provide(Provider<CarProvide>.value(cartPrivde))
    ..provide(Provider<PersonListProvide>.value(personListProvide))
    ..provide(Provider<DetailInfoProvide>.value(detailInfoProvide))
    ..provide(Provider<ChildCategoryGoods>.value(childCategoryGoods));
  runApp(ProviderNode(child: MyApp2(), providers: providers));
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

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  TextEditingController nameController = TextEditingController();
  void initState() {
    super.initState();
    RLogger.initLogger(
        tag: 'home_page',
        isWriteFile: true,
        fileName: "log.txt",
        filePath: "/etc/apache2/doc/");
  }

  @override
  Widget build(BuildContext context) {
    //ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);

    //初始化数据
    Provide.value<PersonListProvide>(context).getPersonList();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('test'),
        ),
        body: Container(
          child: Column(
            children: [
              Text(Provide.value<PersonListProvide>(context)
                  .personList
                  .length
                  .toString()),
              insertRow(),
              SizedBox(
                height: 10,
              ),
              //insertRow(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    child: Text('增加'),
                    onPressed: () {},
                  ),
                  RaisedButton(
                    child: Text('全部'),
                    onPressed: () {
                      Provide.value<PersonListProvide>(context).getPersonList();
                    },
                  ),
                  RaisedButton(
                    child: Text('增加'),
                    onPressed: () {
                      Provide.value<PersonListProvide>(context)
                          .changeList(new Person(
                        name: 'chen',
                        email: 'chen',
                        carModel: 'chen',
                      ));
                    },
                  ),
                ],
              ),

              listv(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
    );
  }

  Widget insertRow() {
    return Container(
      //width: ScreenUtil().setWidth(750),
      //height: ScreenUtil().setHeight(12),
      child: Row(
        children: [
          buildTextField(controller),
        ],
      ),
    );
  }

  Widget listv(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      height: 400,
      child: Provide<PersonListProvide>(
        builder: (context, child, vol) {
          return ListView.builder(
            reverse: false,
            physics: AlwaysScrollableScrollPhysics(),
            itemCount:
                Provide.value<PersonListProvide>(context).personList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.black26,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Provide.value<PersonListProvide>(context)
                          .personList[index]
                          .name,
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    RaisedButton(
                      child: Text('删除'),
                      onPressed: () {
                        Provide.value<PersonListProvide>(context).delPersonById(
                            Provide.value<PersonListProvide>(context)
                                .personList[index]
                                .id);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
