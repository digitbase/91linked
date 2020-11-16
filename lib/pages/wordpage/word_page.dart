import 'package:flutter/material.dart';
import 'package:flutter01/models/words.dart';
import 'package:flutter01/routers/application.dart';
import 'package:flutter_screenutil/screenutil.dart';
import '../../provide/word_provider.dart';
import 'package:provide/provide.dart';

class WordPage extends StatelessWidget {
  final String word;

  WordPage(this.word);
  @override
  Widget build(BuildContext context) {
    //_getWordInfo(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '${word}',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          WordSearch(),
          UserWordList(),
        ],
      ),
    );
  }
}

class UserWordList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: ScreenUtil().setWidth(750),
        //height: ScreenUtil().setHeight(800),
        margin: EdgeInsets.only(top: 10),
        color: Colors.red,
        child: Column(
          children: [
            _title(),
            Text('222'),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      height: ScreenUtil().setHeight(20),
      color: Colors.blue,
      child: Text('title'),
    );
  }
}

class WordSearch extends StatelessWidget {
  final wordSearchKey = GlobalKey<FormState>();
  String word;
  Words wordsList = new Words(data: []);
  String sqlRes = '';

  TextEditingController selectionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    selectionController.text = '';

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          //margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
          height: ScreenUtil().setHeight(80),
          width: ScreenUtil().setWidth(750),
          //color: Colors.red,
          child: Row(
            children: [
              _searchInput(context),
              SizedBox(
                width: 10,
              ),
              _searchBtn(context),
            ],
          ),
        ),
        _wordList(),
      ],
    );
  }

  Widget _searchRes(index) {
    return Container(
      child: Text(index.toString()),
    );
  }

  Widget _wordList() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(50),
      //color: Colors.red,
      child: Provide<WordsProvide>(builder: (context, child, vol) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: wordsList.data.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  String sw = wordsList.data[index].word;
                  Provide.value<WordsProvide>(context).getWordListByFirst(sw);
                  if (wordsList.data.length > 0) {
                    Provide.value<WordsProvide>(context).getWordInfo(sw);
                    selectionController.text = wordsList.data[index].word;
                    selectionController.selection = TextSelection.fromPosition(
                        TextPosition(offset: selectionController.text.length));
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38),
                  ),
                  child: Text(
                    wordsList.data[index].word,
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  ),
                ),
              );
            });
      }),
    );
  }

  Widget _searchBtn(context) {
    return Container(
      width: ScreenUtil().setWidth(100),
      child: RaisedButton(
        onPressed: () {
          Application.router.navigateTo(context,
              '/word?word=' + Provide.value<WordsProvide>(context).initWord);
        },
        color: Colors.white12,
        child: Icon(
          Icons.search,
          color: Colors.black38,
          size: 20,
        ),
      ),
    );
  }

  Widget _searchInput(context) {
    return Container(
      //height: ScreenUtil().setHeight(60),
      width: ScreenUtil().setWidth(580),
      child: Form(
        key: wordSearchKey,
        child: Provide<WordsProvide>(builder: (context, child, vol) {
          return TextFormField(
            controller: selectionController,
            onSaved: (v) {
              word = v;
            },
            onChanged: (v) async {
              word = v;
              await Provide.value<WordsProvide>(context)
                  .getWordListByFirst(word);

              wordsList = Provide.value<WordsProvide>(context).wordSearch;
            },
            strutStyle: StrutStyle(
              fontSize: ScreenUtil().setSp(20),
              height: ScreenUtil().setSp(4),
            ),
            style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
            ),
            decoration: InputDecoration(
              hintText: "search word",
              border: OutlineInputBorder(),
            ),
          );
        }),
      ),
    );
  }
}
