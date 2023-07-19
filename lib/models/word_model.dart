class WordModel {
  bool isHave;
  String position;
  String len;
  String wordGroup;
  String code;

  WordModel({
    this.isHave = false,
    this.position = "",
    this.len = "",
    this.wordGroup = "",
    this.code = "",
  });

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      isHave: json['isHave'],
      position: json['position'],
      len: json['len'],
      wordGroup: json['wordGroup'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isHave'] = isHave;
    data['position'] = position;
    data['len'] = len;
    data['wordGroup'] = wordGroup;
    data['code'] = code;
    return data;
  }
}
