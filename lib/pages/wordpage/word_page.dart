import 'package:flutter/material.dart';
import '../../provide/word_provider.dart';
import 'package:provide/provide.dart';

class WordPage extends StatelessWidget {
  final String word;

  WordPage(this.word);
  @override
  Widget build(BuildContext context) {
    _getWordInfo(context);
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
          _titleBar(),
        ],
      ),
    );
  }

  Widget _titleBar() {
    return Container(
      child: Text('titlBar'),
    );
  }

  Future _getWordInfo(BuildContext context) async {
    print('_getWordInfo');
    await Provide.value<WordsProvide>(context).getWordInfo(word);
    //await Provide.value<GoodDetailProvide>(context).getGoodsInfo('111');
    return "完成加载";
  }
}
