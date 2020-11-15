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

class MyApp3 extends StatelessWidget {
  final registerKey = GlobalKey<FormState>();
  String username, password;
  @override
  void submitForm(context) {
    registerKey.currentState.save();
    registerKey.currentState.validate();
  }

  void clearForm() {
    registerKey.currentState.reset();
  }

  String validatorUsername(v) {
    if (v.isEmpty) {
      return "请输入单词!";
    }
    if (isInData(v)) {
      return "数据已存在!";
    }
    return null;
  }

  bool isInData(v) {
    return true;
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'test',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('nihao'),
        ),
        body: Form(
          key: registerKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  helperText: "",
                ),
                onSaved: (v) {
                  username = v;
                  print('username' + v);
                },
                validator: validatorUsername,
                //autoValidateMode: AutovalidateMode.always,
                autovalidate: true,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'password',
                  helperText: "",
                ),
                onSaved: (v) {
                  password = v;
                  print('password' + v);
                },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    RaisedButton(
                      onPressed: () {
                        clearForm();
                      },
                      color: Theme.of(context).accentColor,
                      child: Text(
                        'Clear',
                        style: TextStyle(),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {
                        submitForm(context);
                      },
                      color: Theme.of(context).accentColor,
                      child: Text(
                        'Resigter',
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditContorller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    textEditContorller.text = 'hi';

    textEditContorller.addListener(() {
      print('addListener: ${textEditContorller.text}');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditContorller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.subject),
          labelText: "Title",
          hintText: "Endter the post title",
          //border: OutlineInputBorder(),
          filled: true,
        ),
        onChanged: (v) {
          print('onchang:' + v);
        },
        controller: textEditContorller,
        //onSubbmitted: (v) {},
      ),
    );
  }
}
