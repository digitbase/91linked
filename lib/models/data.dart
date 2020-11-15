class Data  {
	String id;
	String word;
	String explain;
	String tfFlg;
	String root;

	Data({this.id, this.word, this.explain, this.tfFlg, this.root});

	factory Data.fromJson(Map<String, dynamic> json) {
		return Data(
			id: json['id'],
			word: json['word'],
			explain: json['explain'],
			tfFlg: json['tf_flg'],
			root: json['root'],
		);
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['word'] = this.word;
		data['explain'] = this.explain;
		data['tf_flg'] = this.tfFlg;
		data['root'] = this.root;
		return data;
	}


}
