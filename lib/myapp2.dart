import 'package:flutter/material.dart';
import 'package:flutter01/main.dart';
import 'package:flutter01/provide/personlist_provide.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provide/provide.dart';
import 'Tools/sqliteHelper.dart';
import 'element/r_log.dart';

import 'package:fluro/fluro.dart';
import './routers/routers.dart';
import './routers/application.dart';

class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  String username, password;
  final registerKey = GlobalKey<FormState>(); //注册表单对象
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
    return Container();
  }
}

class _MyApp3State extends State<MyApp2> {
  final registerKey = GlobalKey<FormState>(); //注册表单对象

  String username, password;

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
    final router = FluroRouter();
    Routers.configRouters(router);
    Application.router = router;

    ScreenUtil.init(context);

    //初始化数据
    Provide.value<PersonListProvide>(context).getPersonList();

    return MaterialApp(
      onGenerateRoute: Application.router.generator,
      home: _getHome(context),
    );
  }

  Widget _getHome(context) {
    ScreenUtil.init(context);
    return Scaffold(
      //bottomNavigationBar: BottomSheetDemo(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // RaisedButton(
                //   child: Text('增加'),
                //   onPressed: () {},
                // ),
                RaisedButton(
                  child: Text('全部'),
                  onPressed: () {
                    Provide.value<PersonListProvide>(context).getPersonList();
                  },
                ),
                RaisedButton(
                  child: Text('增加'),
                  onPressed: () {
                    submitForm();
                  },
                ),

                RaisedButton(
                  child: Text('增加'),
                  onPressed: () {
                    submitForm();
                  },
                ),
              ],
            ),
            listv(context),
          ],
        ),
      ),
    );
  }

  Future<void> submitForm() async {
    registerKey.currentState.save();
    if (registerKey.currentState.validate()) {
      String s = await isInData(username);
      if (s == 'true') {
        Fluttertoast.showToast(
          msg: "数据已存在",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          //backgroundColor: Colors.pink,
        );
        print('this is true');
      } else {
        print('this is false');
        Provide.value<PersonListProvide>(context).changeList(new Person(
          name: username,
          email: 'chen',
          carModel: 'chen',
        ));

        registerKey.currentState.reset();
      }
    }
  }

  String validatorUsername(v) {
    if (v.isEmpty) {
      return "请输入单词!";
    }
    return null;
  }

  Future<String> isInData(v) async {
    bool res = await DbHelper.dbHelper.isInData(v);
    print('restostring  ' + res.toString());
    return res.toString();
  }

  Widget insertRow() {
    return Container(
      width: 200,
      child: Form(
        key: registerKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                helperText: "",
              ),
              onSaved: (v) {
                username = v;
              },

              validator: validatorUsername, //验证方法
            ),
          ],
        ),
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
                padding: EdgeInsets.all(5),
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
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Application.router.navigateTo(
                              context,
                              '/word?word=' +
                                  Provide.value<PersonListProvide>(context)
                                      .personList[index]
                                      .name,
                            );
                          },
                          child: Container(
                            //color: Colors.red,
                            width: 250,
                            child: Text(
                              Provide.value<PersonListProvide>(context)
                                  .personList[index]
                                  .name,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 50,
                      child: RaisedButton(
                        child: Icon(Icons.search, size: 20),
                        onPressed: () {
                          Provide.value<PersonListProvide>(context)
                              .delPersonById(
                                  Provide.value<PersonListProvide>(context)
                                      .personList[index]
                                      .id);
                        },
                      ),
                    ),
                    Container(
                      width: 50,
                      child: RaisedButton(
                        child: Icon(Icons.delete, size: 20),
                        onPressed: () {
                          Provide.value<PersonListProvide>(context)
                              .delPersonById(
                                  Provide.value<PersonListProvide>(context)
                                      .personList[index]
                                      .id);
                        },
                      ),
                    )
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
