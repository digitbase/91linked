// To parse this JSON data, do
//
//     final words = wordsFromJson(jsonString);

import 'dart:convert';

Words wordsFromJson(String str) => Words.fromJson(json.decode(str));

String wordsToJson(Words data) => json.encode(data.toJson());

class Words {
  Words({
    this.error,
    this.msg,
    this.data,
  });

  int error;
  String msg;
  List<Datum> data;

  factory Words.fromJson(Map<String, dynamic> json) => Words(
        error: json["error"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.word,
    this.explain,
    this.tfFlg,
    this.root,
  });

  String id;
  String word;
  String explain;
  String tfFlg;
  String root;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        word: json["word"],
        explain: json["explain"],
        tfFlg: json["tf_flg"],
        root: json["root"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "word": word,
        "explain": explain,
        "tf_flg": tfFlg,
        "root": root,
      };
}
